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
    @Published var isNextEnabled: Bool = false
    
    @Published var selectedCycle: CycleState? = nil
    @Published var selectedWeekDate: Date? = nil {
        didSet {
            updateSelectedWeekDay()
        }
    }
    @Published var selectedWeekDay: WeekDay? = nil
    
    @Published var selectedCategory: CategoryState? = nil
    @Published var selectedCoverImage: String? = nil
    
    @Published var freeTimeTable: [TimeTableModel] = dummyFreeTimeTable
    @Published var selectedTimeRange: (start: Double, end: Double) = (0, 0){
        didSet {
            updateNextButtonState()
        }
    }
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var freeTimeIdToCellsMap: [Int: [TimeTableCellId]] = [:]
    
    @Published var location: String = ""
    @Published var maxPeopleCount: Int = 2
    
    @Published var title: String = ""
    @Published var introduction: String = ""
    
    func goToNextPage() {
        guard isNextEnabled else { return }
        
        if currentIndex == 0 {
            currentIndex = 1
        } else {
            currentIndex += 1
        }
        isNextEnabled = false
    }
    
    private func updateSelectedWeekDay() {
        guard let date = selectedWeekDate else {
            selectedWeekDay = nil
            isNextEnabled = false
            return
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let timeZone = TimeZone(identifier: "Asia/Seoul") ?? .current
        let components = calendar.dateComponents(in: timeZone, from: date)
        
        if let weekDayIndex = components.weekday {
            selectedWeekDay = WeekDay.fromWeekdayIndex(weekDayIndex)
        }
        
        isNextEnabled = selectedWeekDay != nil
    }
    
    
    var formattedDate: String? {
        guard let date = selectedWeekDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul") // KST 적용
        return formatter.string(from: date)
    }
    
    func getSelectedWeekDayEnum() -> WeekDay? {
        return selectedWeekDay
    }
    
    func resetSelectedTimeRange() {
        selectedTimeRange = (start: 0, end: 0)
        selectedCells.removeAll()
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
    
    func updateNextButtonState() {
        let isTitleValid = title.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2
        let isIntroductionValid = introduction.trimmingCharacters(in: .whitespacesAndNewlines).count >= 20
        let isLocationValid = !location.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isTimeRangeValid = selectedTimeRange.start > 0 && selectedTimeRange.end > 0

        isNextEnabled = (isTitleValid && isIntroductionValid) || isLocationValid || isTimeRangeValid
    }
}
