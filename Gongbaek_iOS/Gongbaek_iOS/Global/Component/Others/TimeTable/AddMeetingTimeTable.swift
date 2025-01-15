//
//  AddMeetingTimeTable.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/15/25.
//

import SwiftUI

struct AddMeetingTimeTable: View {
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    private let columns = [GridItem(.fixed(24), spacing: 1)]
    + Array(repeating: GridItem(.flexible(), spacing: 1), count: 5)

    @Binding var freeTimeTable: [TimeTableModel]
    @State var selectedDay: WeekDay
    @State var selectedCells: Set<TimeTableCellId> = []
    @State private var selectedTimeRange: (start: Double, end: Double)? = nil
    /// 공강시간 id값과 해당 시간표셀 id들을 매핑한 Dictionary
    @State private var freeTimeIdToCellsMap: [Int: [TimeTableCellId]] = [:]
    @State private var currentFreeTimeId: Int? = nil

    var body: some View {
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
        .onAppear {
            initFreeTimeIdToCellsMap()
        }
    }
    
    // MARK: - Components
    
    private func dayHeader() -> some View {
        GridRow {
            /// 빈칸
            Rectangle()
                .fill(Color.white)
                .frame(minWidth: 24, minHeight: 24)
            
            /// 요일
            ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
                /// 선택 요일인지 여부
                let isSelectedDay = selectedDay == WeekDay.allCases[dayIndex]
                
                Text(WeekDay.allCases[dayIndex].rawValue)
                    .frame(minWidth: 62, maxWidth: .infinity, minHeight: 24)
                    .font(.pretendard(isSelectedDay ? .caption2_b_12 : .caption2_r_12))
                    .foregroundStyle(isSelectedDay ? .white : .gray06)
                    .background(isSelectedDay ? .gray09 : .white)
            }
        }
    }
    
    private func hourCell(_ hourIndex: Int) -> some View {
        /// 시간을 1로 나눴을 때 나머지 존재 여부 -> 30분 단위 시간 구분 위함
        let isOnTheHour = hours[hourIndex].truncatingRemainder(dividingBy: 1) == 0
        
        return Text(isOnTheHour ? "\(Int(hours[hourIndex]))" : "")
            .frame(width: 24, height: 28, alignment: .topTrailing)
            .font(.pretendard(.caption2_r_12))
            .foregroundStyle(.gray06)
            .background(.white)
    }
    
    private func timeTableCells(_ hourIndex: Int) -> some View {
        ForEach(WeekDay.allCases.indices, id: \.self) { dayIndex in
            /// 모든 시간표셀들을 구분하기 위한 식별자 id 부여
            let cellId = TimeTableCellId(hourIndex: hours[hourIndex], dayIndex: dayIndex)
            let cellState = cellState(cellId)
            let bottomPadding = bottomPadding(hourIndex, cellId, cellState)
            
            Rectangle()
                .fill(selectedCells.contains(cellId) ? .mainOrange : cellColor(cellState))
                .frame(maxWidth: .infinity, minHeight: 24)
                .padding(.bottom, bottomPadding)
                .onTapGesture {
                    guard cellState == .active else { return }
                    handleOnCellTapped(cellId)
                }
                .id(cellId)
        }
    }
    
    // MARK: - Helper Methods
    
    private func bottomPadding(
        _ hourIndex: Int,
        _ cellId: TimeTableCellId,
        _ cellState: TimeTableCellState
    ) -> CGFloat {
        /// 시간표셀 하단 padding은 연속적으로 이어질 때만 -1로 구분선 제거
        /// 다만 17.5시에 해당하는 셀들은 최하단 셀이므로 0
        if hours[hourIndex] != 17.5 {
            if selectedCells.contains(cellId)
            || cellState == .inactive {
                return -1
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    /// 공강시간 id에 해당하는 셀들 딕셔너리 초기화
    private func initFreeTimeIdToCellsMap() {
        for freeTime in freeTimeTable {
            guard let dayIndex = WeekDay.allCases.firstIndex(of: freeTime.weekDay)
            else { return }
            
            /// 공강시간 시작-종료 시간에 해당하는 모든 시간들을 30분 단위로 쪼갬
            /// -> 각 시간에 해당되는 cell id값  만들고 cells 배열에 저장
            let cells = Array(stride(
                from: freeTime.startTime,
                to: freeTime.endTime,
                by: 0.5
            )).map {
                TimeTableCellId(hourIndex: $0, dayIndex: dayIndex)
            }
            /// 딕셔너리 key는 공강시간 id, value는 해당 공강시간에 속하는 cells
            freeTimeIdToCellsMap[freeTime.id] = cells
        }
    }
    
    /// 특정 셀의 시간이 수업시간(비활성), 공강시간(선택 요일X-비활성), 공강시간(선택 요일-활성)
    /// 세가지 중 어디에 속하는지 확인
    private func cellState(_ cellId: TimeTableCellId) -> TimeTableCellState {
        /// 공강시간인지 확인 -> 선택 요일인지 확인
        for (_, cells) in freeTimeIdToCellsMap
        where cells.contains(cellId) {
            let day = WeekDay.allCases[cellId.dayIndex]
            return selectedDay == day ? .active : .freeTime
        }
        return .inactive
    }
    
    private func handleOnCellTapped(_ cellId: TimeTableCellId) {
        guard let newFreeTimeId = freeTimeId(for: cellId)
        else { return }
        
        if currentFreeTimeId != newFreeTimeId {
            currentFreeTimeId = newFreeTimeId
            selectedCells = [cellId]
        } else {
            selectedCells.insert(cellId)
            
            /// 공강시간 id 같은 경우, 미선택됐던 중간 셀들도 선택하는 기능
            /// 선택된 셀들의 시작시간 중 최소, 종료시간 중 최대를 튜플로 selectedTimeRange에 저장
            selectedTimeRange = selectedCells.reduce(into: (
                start: cellId.hourIndex,
                end: cellId.hourIndex + 0.5
            )) {
                $0.start = min($0.start, $1.hourIndex)
                $0.end = max($0.end, $1.hourIndex + 0.5)
            }
            guard let timeRange = selectedTimeRange else { return }

            /// 선택된 시간 범위에 해당되는 모든 시간들 30분 단위로 cell id 만들어서 selectedCells에 저장
            selectedCells = Set(Array(stride(
                from: timeRange.start,
                to: timeRange.end,
                by: 0.5
            )).map {
                TimeTableCellId(hourIndex: $0, dayIndex: cellId.dayIndex)
            })
        }
    }
    
    /// 셀에 해당하는 공강 시간 id 찾기
    private func freeTimeId(for cellId: TimeTableCellId) -> Int? {
        for (freeTimeId, cells) in freeTimeIdToCellsMap
        where cells.contains(cellId) {
            return freeTimeId
        }
        return nil
    }
    
    private func cellColor(_ cellState: TimeTableCellState) -> Color {
        switch cellState {
        case .inactive:
            return .gray02
        case .freeTime:
            return .gray01
        case .active:
            return .white
        }
    }
}

#Preview {
    @Previewable @State var freeTimeTable = [
        TimeTableModel(id: 0, weekDay: .MON, startTime: 9, endTime: 12),
        TimeTableModel(id: 1, weekDay: .MON, startTime: 14, endTime: 17.5),
        TimeTableModel(id: 2, weekDay: .TUE, startTime: 14, endTime: 18),
        TimeTableModel(id: 3, weekDay: .WED, startTime: 9, endTime: 11),
        TimeTableModel(id: 4, weekDay: .WED, startTime: 12, endTime: 13),
        TimeTableModel(id: 5, weekDay: .WED, startTime: 13.5, endTime: 15),
        TimeTableModel(id: 6, weekDay: .THU, startTime: 10, endTime: 18),
        TimeTableModel(id: 7, weekDay: .FRI, startTime: 10, endTime: 17)
        ]
    
    AddMeetingTimeTable(freeTimeTable: $freeTimeTable, selectedDay: .WED)
        .padding(16)
}
