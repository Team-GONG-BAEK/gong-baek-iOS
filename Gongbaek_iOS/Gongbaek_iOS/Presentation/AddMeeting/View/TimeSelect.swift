//
//  DateSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct TimeSelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    var body: some View {
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
            
            ScrollView {
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
                
                AddMeetingTimeTable(viewModel: viewModel)
                    .padding(.bottom, 8)
            }
            
        }
        .padding(.horizontal, 16)
    }
}
