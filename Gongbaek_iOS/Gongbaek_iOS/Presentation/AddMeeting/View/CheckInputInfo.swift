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
            
            if let category = viewModel.selectedCategory,
               let selectedCoverIndex = viewModel.selectedCoverIndex,
               0 <= selectedCoverIndex,
               selectedCoverIndex < category.coverImage.count {
                Image(category.coverImage[selectedCoverIndex])
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 283)
                    .cornerRadius(4)
            } else {
                Rectangle()
                    .fill(.gray03)
                    .frame(maxWidth: .infinity)
                    .frame(height: 283)
                    .cornerRadius(4)
            }
            
            Text(viewModel.title)
                .pretendardFont(.title2_b_18)
                .foregroundColor(.gray10)
                .padding(.top, 20)
            
            Text("부적절하거나 불쾌감을 줄 수 있는 콘텐츠는 제재를 받을 수 있습니다.")
                .pretendardFont(.caption2_r_12)
                .foregroundStyle(.gray07)
                .padding(.top, 4)
                .padding(.bottom, 14)
            
            VStack(alignment: .leading, spacing: 10) {
                TimeBox(
                    state: .gray,
                    text: viewModel.getFormattedDateTime(),
                    font: .body1_m_16
                )
                LocationBox(
                    state: .gray,
                    text: "\(viewModel.location)",
                    font: .body1_m_16
                )
                PersonBox(
                    state: .gray,
                    text: "\(viewModel.maxPeopleCount)명",
                    font: .body1_m_16
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
