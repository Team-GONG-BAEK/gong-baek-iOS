//
//  CheckInputInfo.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct CheckInputInfo: View {
    @StateObject private var viewModel = AddMeetingViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "소개글을 작성해주세요.", subtitle: nil)
                    .padding(.bottom, 28)
                
                Image(.sample)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 283)
                    .cornerRadius(4)
                    .padding(.bottom, 28)
                
                Text("화석의 튜스데이 점심 클럽")
                    .font(.pretendard(.title2_b_18))
                    .foregroundColor(.gray10)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    TimeBox(
                        state: .gray,
                        text: "매주 수요일 12시 - 15시",
                        font: .pretendard(
                            .body1_m_16
                        )
                    )
                    LocationBox(
                        state: .gray,
                        text: "세종관 1층 로비",
                        font: .pretendard(
                            .body1_m_16
                        )
                    )
                    PersonBox(
                        state: .gray,
                        text: "4명",
                        font: .pretendard(
                            .body1_m_16
                        )
                    )
                }
                .padding(.vertical, 16)
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.gray01)
                )
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                viewModel.goToNextPage()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)

    }
}

#Preview {
    CheckInputInfo()
}
