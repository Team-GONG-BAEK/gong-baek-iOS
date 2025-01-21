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
    
    @Binding var selectedCells: Set<TimeTableCellId>
    @Binding var classTimeTable: [(day: WeekDay, start: Double, end: Double)]
    
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
                .fill(selectedCells.contains(cellId) ? .subOrange : .grayWhite)
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

extension OnboardingTimeTable {
    
    /// 선택된 셀들 수업 시간표 모델 데이터로 변환
    private func saveSelectedCellsToClassTimeTable() {
        classTimeTable.removeAll()
        
        // dayIndex -> 요일별로 그룹화
        // hourIndex -> 오름차순 정렬
        let groupedCells = Dictionary(grouping: selectedCells) { $0.dayIndex }
            .mapValues { cells in
                cells.sorted(by: {
                    $0.hourIndex < $1.hourIndex
                })
            }

        // 요일 그룹 순서대로 연속적인 수업 시간 계산
        for (dayIndex, cells) in groupedCells {
            var startTime: Double?
            var endTime: Double?
            
            for cell in cells {
                if let currentEnd = endTime,
                    currentEnd == cell.hourIndex {
                    // 현재 endTime과 연속적인 cell일 경우
                    endTime = cell.hourIndex + 0.5
                } else {
                    // 불연속일 땐 지금까지 저장해둔 거 append
                    if let s = startTime,
                        let e = endTime {
                        classTimeTable.append((day: WeekDay.allCases[dayIndex], start: s, end: e))
                    }
                    // 다시 시작! 현재 cell 시작/종료 시간 저장
                    startTime = cell.hourIndex
                    endTime = cell.hourIndex + 0.5
                }
            }
            
            // 마지막 남은 범위 추가
            if let s = startTime, let e = endTime {
                classTimeTable.append((day: WeekDay.allCases[dayIndex], start: s, end: e))
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCells: Set<TimeTableCellId> = []
    @Previewable @State var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    
    OnboardingTimeTable(
        selectedCells: $selectedCells,
        classTimeTable: $classTimeTable
    )
    .padding(16)
}
