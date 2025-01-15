//
//  OnboardingTimeTable.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/16/25.
//

import SwiftUI

struct OnboardingTimeTable: View {
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    private let columns = [GridItem(.fixed(24), spacing: 1)]
    + Array(repeating: GridItem(.flexible(), spacing: 1), count: 5)
    
    @State private var selectedCells: Set<TimeTableCellId> = []
    
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
    
    // MARK: - Components
    
    private func dayHeader() -> some View {
        GridRow {
            Rectangle()
                .fill(Color.white)
                .frame(minWidth: 24, minHeight: 24)
            
            ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                Text(WeekDay.allCases[dayIndex].rawValue)
                    .frame(minWidth: 62, maxWidth: .infinity, minHeight: 24)
                    .font(.pretendard( .caption2_r_12))
                    .foregroundStyle(.gray06)
                    .background(.white)
            }
        }
    }
    
    private func hourCell(_ hourIndex: Int) -> some View {
        let isOnTheHour = hours[hourIndex].truncatingRemainder(dividingBy: 1) == 0
        
        return Text(isOnTheHour ? "\(Int(hours[hourIndex]))" : "")
            .frame(width: 24, height: 28, alignment: .topTrailing)
            .font(.pretendard(.caption2_r_12))
            .foregroundStyle(.gray06)
            .background(.white)
    }
    
    private func timeTableCells(_ hourIndex: Int) -> some View {
        ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
            let cellId = TimeTableCellId(hourIndex: hours[hourIndex], dayIndex: dayIndex)
            let bottomPadding = bottomPadding(hourIndex, cellId)
            
            Rectangle()
                .fill(selectedCells.contains(cellId) ? .subOrange : .white)
                .frame(maxWidth: .infinity, minHeight: 24)
                .padding(.bottom, bottomPadding)
                .onTapGesture {
                    handleOnCellTapped(cellId)
                }
                .id(cellId)
        }
    }
    
    // MARK: - Helper Methods
    
    private func bottomPadding(_ hourIndex: Int, _ cellId: TimeTableCellId) -> CGFloat {
        if hours[hourIndex] != 17.5 {
            if selectedCells.contains(cellId) {
                return -1
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    private func handleOnCellTapped(_ cellId: TimeTableCellId) {
        if selectedCells.contains(cellId) {
            selectedCells.remove(cellId)
        } else {
            selectedCells.insert(cellId)
        }
    }
}

#Preview {
    OnboardingTimeTable()
        .padding(16)
}
