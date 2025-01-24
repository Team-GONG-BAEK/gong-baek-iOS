//
//  NicknameInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct NicknameInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            TitleTextBox(
                title: "닉네임을 설정해주세요.",
                subtitle: "프로필에 표시되는 이름으로, 언제든 변경할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            CustomTextField(
                text: $viewModel.nickname,
                showError: $viewModel.showNicknameError,
                state: .nickname
            )
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

#Preview {
    NicknameInputView(viewModel: SignupViewModel())
}
