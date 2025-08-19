//
//  AddMeetingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

class AddMeetingViewModel: ObservableObject {
    
    let totalSteps: Int = 8
    
    @Published var currentIndex: Int = 0
    @Published var selectedCycle: CycleState? = nil
    @Published var selectedWeekDate: Date? = nil {
        didSet {
            updateSelectedWeekDay()
        }
    }
    @Published var selectedWeekDay: WeekDay? = nil
    @Published var selectedCategory: CategoryState? = nil
    @Published var selectedCoverIndex: Int? = nil
    @Published var timeTable: [TimeTableModel] = []
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var selectedTimeRange: (start: Double, end: Double) = (0, 0)
    @Published var location: String = ""
    @Published var maxPeopleCount: Int = 2
    @Published var title: String = ""
    @Published var introduction: String = ""
    @Published var retryCount = 0 {
        didSet {
            if retryCount > 3 {
                resetRetryState()
            }
        }
    }
    
    var selectedFormattedDate: String? {
        guard let date = selectedWeekDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        return formatter.string(from: date)
    }
    
    func goToNextPage() {
        if isNextButtonEnabled() && currentIndex < totalSteps - 1 {
            resetValuesForNextPage()
            currentIndex += 1
        }
    }
    
    private func resetRetryState() {
        currentIndex = 0
        retryCount = 0
        selectedCycle = nil
    }
    
    func isNextButtonEnabled() -> Bool {
        switch currentIndex {
        case 0:
            return selectedCycle != nil
        case 1:
            return selectedCycle == .once
            ? selectedWeekDate != nil
            : selectedWeekDay != nil
        case 2:
            return selectedTimeRange.start > 0 && selectedTimeRange.end > selectedTimeRange.start
        case 3:
            return selectedCategory != nil
        case 4:
            return selectedCoverIndex != nil
        case 5:
            return location.count >= 2 && isValidLocationFormat()
        case 6:
            return title.count >= 2
        case 7:
            return true
        default:
            return false
        }
    }
    
    private func isValidLocationFormat() -> Bool {
        let regex = "^[가-힣a-zA-Z0-9\\s]+$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: location)
    }
    
    func resetValuesForNextPage() {
        switch self.currentIndex {
        case 0:
            selectedWeekDate = nil
            selectedWeekDay = nil
        case 1:
            selectedTimeRange = (0, 0)
            selectedCells = Set([])
        case 2:
            selectedCategory = nil
        case 3:
            selectedCoverIndex = nil
        case 4:
            location = ""
            maxPeopleCount = 2
        case 5:
            title = ""
            introduction = ""
        default:
            break
        }
    }
    
    func updateSelectedWeekDay() {
        guard let date = selectedWeekDate else {
            selectedWeekDay = nil
            return
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let timeZone = TimeZone(identifier: "Asia/Seoul") ?? .current
        let components = calendar.dateComponents(in: timeZone, from: date)
        
        if let weekDayIndex = components.weekday {
            selectedWeekDay = WeekDay.fromWeekdayIndex(weekDayIndex)
        }
        
        print("✅ 선택된 날짜: \(selectedFormattedDate ?? "N/A")")
        print("✅ 선택된 요일: \(selectedWeekDay?.rawValue ?? "N/A")")
    }
    
    func getSelectedWeekDayEnum() -> WeekDay? {
        guard let selectedDay = selectedWeekDay else { return nil }
        return WeekDay(rawValue: selectedDay.rawValue) ?? WeekDay.fromRawValue(selectedDay.rawValue)
    }
    
    /// 수업 시간표 -> 공강시간표 변환
    func freeTimeTable() -> [TimeTableModel] {
        WeekDay.allCases.flatMap { weekDay -> [TimeTableModel] in
            let sortedClasses = (timeTable.filter { $0.weekDay == weekDay.englishName })
                .sorted { $0.startTime < $1.startTime }
            
            var freeTimes: [TimeTableModel] = []
            var freeTimeStart = 9.0
            
            for classTime in sortedClasses {
                if freeTimeStart < classTime.startTime {
                    freeTimes.append(
                        .init(
                            id: UUID().hashValue,
                            weekDay: weekDay.englishName,
                            startTime: freeTimeStart,
                            endTime: classTime.startTime
                        )
                    )
                }
                freeTimeStart = classTime.endTime
            }
            
            if freeTimeStart < 18.0 {
                freeTimes.append(
                    .init(
                        id: UUID().hashValue,
                        weekDay: weekDay.englishName,
                        startTime: freeTimeStart,
                        endTime: 18.0
                    )
                )
            }
            
            return freeTimes
        }
    }
    
    func increasePeopleCount() {
        if maxPeopleCount < 10 {
            maxPeopleCount += 1
        }
    }
    
    func decreasePeopleCount() {
        if maxPeopleCount > 2 {
            maxPeopleCount -= 1
        }
    }
    
    func getFormattedDateTime() -> String {
        guard let selectedCycle = selectedCycle else { return "날짜와 시간을 선택해주세요." }
        
        let startTime = Date.formatTime(selectedTimeRange.start)
        let endTime = Date.formatTime(selectedTimeRange.end)
        
        if selectedCycle == .once {
            guard let selectedDate = selectedWeekDate else { return "날짜 선택 필요" }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M월 d일 EEEE"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            
            let formattedDate = dateFormatter.string(from: selectedDate)
            return "\(formattedDate) \(startTime) - \(endTime)"
            
        } else if selectedCycle == .weekly {
            guard let selectedWeekDay = selectedWeekDay else { return "요일 선택 필요" }
            return "매주 \(selectedWeekDay.rawValue) \(startTime) - \(endTime)"
        }
        
        return "날짜와 시간을 선택해주세요."
    }
    
    func getTimeTable() {
        Providers.fillingProvider.request(target: .getTimeTable, instance: BaseResponse<GetTimeTableResponseDTO>.self) { response in
            guard response.success, let timeTableResponse = response.data else {
                print("❌ 시간표 불러오기 실패: \(response.message ?? "알 수 없는 오류")")
                return
            }
            
            DispatchQueue.main.async {
                self.timeTable = timeTableResponse.timeTable
            }
        }
    }
    
    func postMeeting(completion: @escaping (Bool) -> ()) {
        guard selectedCoverIndex != nil else { return }
        let requestData = makeMeetingModel()
        print("🛠️ 최종 weekDate 값: \(requestData.weekDate)")
        
        Providers.fillingProvider.request(target: .postMeeting(data: requestData), instance: BaseResponse<EmptyResponseDTO>.self) { response in
            if response.success {
                self.retryCount = 0
                print("✅ 모임 등록 성공!")
            } else {
                print("❌ 모임 등록 실패")
            }
            completion(response.success)
        }
    }
    
    private func makeMeetingModel() -> AddMeetingModel {
        return AddMeetingModel(
            groupType: selectedCycle == .once ? "ONCE" : "WEEKLY",
            weekDate: selectedFormattedDate ?? "",
            weekDay: selectedWeekDay?.englishName ?? "MON",
            startTime: selectedTimeRange.start,
            endTime: selectedTimeRange.end,
            category: selectedCategory?.serverName ?? "",
            coverImg: (selectedCoverIndex ?? 0),
            location: location,
            maxPeopleCount: maxPeopleCount,
            groupTitle: title,
            introduction: introduction
        )
    }
}
