//
//  OnboardingConfirmBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/16/25.
//

import SwiftUI

struct OnboardingConfirmBar: View {
    let grayButtonText: String
    let orangeButtonText: String
    var onTapGrayButton: (() -> Void)?
    var onTapOrangeButton: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                onTapGrayButton?()
            }) {
                Text(grayButtonText)
                    .pretendardFont(.title2_sb_18)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 17)
                    .foregroundStyle(.grayWhite)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.gray09)
                    )
            }
            
            BasicButton(text: orangeButtonText, onTap: onTapOrangeButton)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    OnboardingConfirmBar(grayButtonText: "시간표 변경", orangeButtonText: "가입 완료")
}
