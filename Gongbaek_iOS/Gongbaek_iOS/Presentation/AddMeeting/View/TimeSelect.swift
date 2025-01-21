//
//  DateSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct TimeSelect: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: viewModel.currentIndex)
                .padding(.bottom, 40)
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "공백을 채울 시간을 선택해주세요.", subtitle: nil)
                    .padding(.bottom, 20)
                
                HStack(spacing: 12) {
                    SelectedTimeBox(time: viewModel.selectedTimeRange.start.formatTime())
                    Rectangle()
                        .fill(.gray04)
                        .frame(width: 16, height: 2)
                    SelectedTimeBox(time: viewModel.selectedTimeRange.end.formatTime())
                }
                .padding(.bottom, 30)
                
                HStack(spacing: 12) {
                    Text("나의 시간표")
                        .font(.pretendard(.body1_b_16))
                        .foregroundColor(.gray08)
                    Spacer()
                    Button(action: {
                        viewModel.selectedTimeRange = (start: 0, end: 0)
                        viewModel.selectedCells.removeAll()
                    }) {
                        HStack(spacing: 0) {
                            Text("다시 선택")
                                .font(.pretendard(.caption2_m_12))
                                .foregroundColor(.mainOrange)
                            Image(.icOptionReset18)
                                .foregroundColor(.mainOrange)
                                .frame(width: 18, height: 18)
                        }
                    }
                }
                .padding(.bottom, 10)
                
                ScrollView {
                    AddMeetingTimeTable(
                        viewModel: viewModel,
                        freeTimeTable: viewModel.freeTimeTable,
                        selectedDay: viewModel.getSelectedWeekDayEnum() ?? .MON,
                        selectedTimeRange: $viewModel.selectedTimeRange,
                        selectedCells: $viewModel.selectedCells
                    )
                }
                
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                viewModel.goToNextPage()
                navigationManager.push(view: FillingDestination.categorySelect)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}

