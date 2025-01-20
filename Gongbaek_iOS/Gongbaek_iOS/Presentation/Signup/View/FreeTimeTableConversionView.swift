//
//  FreeTimeTableConversionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct FreeTimeTableConversionView: View {
    @ObservedObject var viewModel: SignupViewModel
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    
    var body: some View {
        VStack(spacing: 0) {
            // TODO: 스크롤 영역 수정 가능성 있음
            ScrollView {
                TitleTextBox(
                    title: "공강시간표가 완성되었어요!",
                    subtitle: "잘못된 시간표가 있는지 확인해주세요."
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
                
                ViewModeTimeTable(unselectedCells: getFreeTimeCells())
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
            }
                
            Spacer()
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
        return allCells.subtracting(viewModel.selectedCells)
    }
}

#Preview {
    FreeTimeTableConversionView(viewModel: SignupViewModel())
}
