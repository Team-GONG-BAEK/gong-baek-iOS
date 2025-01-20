//
//  AddMeetingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

class AddMeetingViewModel: ObservableObject {
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
    @Published var selectedTimeRange: (start: Double, end: Double) = (0, 0)
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var freeTimeIdToCellsMap: [Int: [TimeTableCellId]] = [:]
    @Published var isNextEnabled: Bool = false
    
    @Published var location: String = ""
    @Published var maxPeopleCount: Int = 2
    
    @Published var title: String = ""
    @Published var introduction: String = ""
    
    @Published var currentIndex: Int = 0
    
    let totalSteps: Int = 8
    
    func goToNextPage() {
        if currentIndex < totalSteps - 1 {
            currentIndex += 1
        }
    }
    
    func getSelectedWeekDayEnum() -> WeekDay? {
        guard let selectedDay = selectedWeekDay else { return nil }
        return WeekDay(rawValue: selectedDay.rawValue) ?? WeekDay.fromRawValue(selectedDay.rawValue)
    }
    
    var selectedFormattedDate: String? {
        guard let date = selectedWeekDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        return formatter.string(from: date)
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
    
}
