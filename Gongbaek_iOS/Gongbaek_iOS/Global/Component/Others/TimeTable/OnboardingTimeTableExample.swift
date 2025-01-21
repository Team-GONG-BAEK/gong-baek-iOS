//
//  OnboardingTimeTableExample.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/17/25.
//

import SwiftUI

struct OnboardingTimeTableExample: View {
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    @State var selectedCells: Set<TimeTableCellId> = []
    @State var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    @State private var isShowingFreeTimeTable = false
    
    var body: some View {
        VStack {
            if isShowingFreeTimeTable {
                ViewModeTimeTable(unselectedCells: getFreeTimeCells())
                    .padding(16)
            } else {
                OnboardingTimeTable(
                    selectedCells: $selectedCells,
                    classTimeTable: $classTimeTable
                )
                .padding(16)
            }
            
            Button(isShowingFreeTimeTable ? "시간표 변경" : "공강 시간표로 변환") {
                isShowingFreeTimeTable.toggle()
            }
        }
    }
    
    /// 공강 시간표 CellId 배열로 변환
    private func getFreeTimeCells() -> Set<TimeTableCellId> {
        let allCells: Set<TimeTableCellId> = Set(
            WeekDay.allCases.indices.flatMap { dayIndex in
                hours.map { hourIndex in
                    TimeTableCellId(hourIndex: hourIndex, dayIndex: dayIndex)
                }
            }
        )
        return allCells.subtracting(selectedCells)
    }
}

#Preview {
    OnboardingTimeTableExample()
}
