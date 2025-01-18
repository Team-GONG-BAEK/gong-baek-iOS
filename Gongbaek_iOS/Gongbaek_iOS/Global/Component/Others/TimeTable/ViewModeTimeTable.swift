//
//  ViewModeTimeTable.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/17/25.
//

import SwiftUI

struct ViewModeTimeTable: View {
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    private let columns = [GridItem(.fixed(24), spacing: 1)]
    + Array(repeating: GridItem(.flexible(), spacing: 1), count: 5)
    let unselectedCells: Set<TimeTableCellId>
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 1) {
                dayHeader()
                
                ForEach(hours.indices, id: \.self) { hourIndex in
                    hourCell(hourIndex)
                    timeTableCells(hourIndex)
                }
            }
            .background(.gray02)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray02, lineWidth: 1)
            )
        }
    }
    
    private func dayHeader() -> some View {
        GridRow {
            Rectangle()
                .fill(.grayWhite)
                .frame(minWidth: 24, minHeight: 24)
            
            ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                Text(WeekDay.allCases[dayIndex].rawValue)
                    .pretendardFont( .caption2_r_12)
                    .frame(minWidth: 62, maxWidth: .infinity, minHeight: 24)
                    .foregroundStyle(.gray06)
                    .background(.grayWhite)
            }
        }
    }
    
    private func hourCell(_ hourIndex: Int) -> some View {
        let isOnTheHour = hours[hourIndex].truncatingRemainder(dividingBy: 1) == 0
        
        return Text(isOnTheHour ? "\(Int(hours[hourIndex]))" : "")
            .pretendardFont(.caption2_r_12)
            .frame(width: 24, height: 28, alignment: .topTrailing)
            .foregroundStyle(.gray06)
            .background(.grayWhite)
    }
    
    private func timeTableCells(_ hourIndex: Int) -> some View {
        ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
            let cellId = TimeTableCellId(hourIndex: hours[hourIndex], dayIndex: dayIndex)
            let bottomPadding = bottomPadding(hourIndex, cellId)
            
            Rectangle()
                .fill(unselectedCells.contains(cellId) ? .subOrange : .grayWhite)
                .frame(maxWidth: .infinity, minHeight: 24)
                .padding(.bottom, bottomPadding)
                .id(cellId)
        }
    }
    
    // MARK: - Helper Methods
    
    private func bottomPadding(_ hourIndex: Int, _ cellId: TimeTableCellId) -> CGFloat {
        if hours[hourIndex] != 17.5 {
            if unselectedCells.contains(cellId) {
                return -1
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
