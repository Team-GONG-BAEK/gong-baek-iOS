//
//  CheckInputInfo.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct CheckInputInfo: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "입력한 정보가 맞는지 확인해주세요!", subtitle: nil)
                .padding(.bottom, 28)
            
            Image(.sample)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 283)
                .cornerRadius(4)
                .padding(.bottom, 28)
            
            Text(viewModel.title)
                .font(.pretendard(.title2_b_18))
                .foregroundColor(.gray10)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                TimeBox(
                    state: .gray,
                    text: "\(viewModel.selectedTimeRange)",
                    font: .pretendard(
                        .body1_m_16
                    )
                )
                LocationBox(
                    state: .gray,
                    text: "\(viewModel.location)",
                    font: .pretendard(
                        .body1_m_16
                    )
                )
                PersonBox(
                    state: .gray,
                    text: "\(viewModel.maxPeopleCount)명",
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
    }
}

