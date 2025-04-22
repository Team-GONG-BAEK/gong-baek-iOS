//
//  CycleSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/20/25.
//

import SwiftUI

struct CycleSelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 20)
            
            HStack(spacing: 8) {
                SmallButton(
                    text: "한번만 볼래요",
                    isTapped: viewModel.selectedCycle == .once
                ) {
                    viewModel.selectedCycle = .once
                }
                
                SmallButton(
                    text: "매주 볼래요",
                    isTapped: viewModel.selectedCycle == .weekly
                ) {
                    viewModel.selectedCycle = .weekly
                }
            }
            .padding(.bottom, 48)

            HStack {
                Image(.icMark16)
                    .foregroundColor(.mainOrange)
                    .frame(width: 16, height: 16)
                Text("모임 개설자는 원한다면 중간에 언제든 모임을 삭제할 수 있습니다.")
                    .pretendardFont(.caption1_m_13)
                    .foregroundColor(.mainOrange)
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 16)
    }
}



#Preview {
    @Previewable @StateObject var viewModel = AddMeetingViewModel()
    return CycleSelect(viewModel: viewModel)
}
