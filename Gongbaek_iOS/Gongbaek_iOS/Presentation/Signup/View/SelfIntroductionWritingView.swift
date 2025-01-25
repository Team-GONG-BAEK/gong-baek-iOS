//
//  SelfIntroductionWritingView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct SelfIntroductionWritingView: View {
    @ObservedObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            TitleTextBox(
                title: "회원님을 자유롭게 설명해주세요.",
                subtitle: "연락처나 SNS 입력이 아닌,\n자신을 소개하는 글을 적어주세요.",
                highlightSubtitleText: "자신을 소개하는 글"
            )
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            
            CustomTextEditor(
                text: $viewModel.introduction,
                isSignupView: true
            )
            .padding(.top, 24)
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

#Preview {
    SelfIntroductionWritingView(viewModel: SignupViewModel())
}
