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
            print("⏰ 선택된 시간 범위 변경됨: \(selectedTimeRange.start)시 ~ \(selectedTimeRange.end)시")
        }
    }
    
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

        print("📅 선택된 날짜: \(formattedDate ?? "N/A"), 요일: \(selectedWeekDay?.rawValue ?? "N/A")")
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
    
}
