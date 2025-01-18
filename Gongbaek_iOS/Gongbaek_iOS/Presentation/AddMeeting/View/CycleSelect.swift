//
//  CycleSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CycleSelect: View {
    @Binding var currentIndex: Int
    @Binding var isNextEnabled: Bool
    @Binding var selectedCycle: CycleState?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 20)

            HStack(spacing: 8) {
                SmallButton(text: "한번만 볼래요", isTapped: selectedCycle == .once) {
                    selectedCycle = .once
                    isNextEnabled = true
                }
                SmallButton(text: "매주 볼래요", isTapped: selectedCycle == .weekly) {
                    selectedCycle = .weekly
                    isNextEnabled = true
                }
            }
            .padding(.bottom, 48)
            
            HStack {
                Image(.icMark16)
                    .foregroundColor(.mainOrange)
                    .frame(width: 16, height: 16)
                Text("매주 볼래요의 경우 모임은 한 학기동안 유효합니다.")
                    .pretendardFont(.body2_sb_14)
                    .foregroundColor(.mainOrange)
            }
            .padding(.bottom, 10)
            
            Text("1학기는 6월 30일 0시까지, 2학기는 12월 31일 0시까지가 기준입니다.\n모임 개설자는 원한다면 중간에 언제든 모임을 삭제할 수 있습니다.")
                .pretendardFont(.caption2_r_12)
                .foregroundColor(.gray08)
        }
        .padding(.horizontal, 16)
    }
}

