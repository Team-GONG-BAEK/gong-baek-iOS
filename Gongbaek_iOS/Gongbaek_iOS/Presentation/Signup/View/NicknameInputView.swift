//
//  NicknameInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct NicknameInputView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var nickname = ""
    @State var showError = false
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: 1)
            
            TitleTextBox(
                title: "닉네임을 설정해주세요.",
                subtitle: "프로필에 표시되는 이름으로, 언제든 변경할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            CustomTextField(
                text: $nickname,
                showError: $showError,
                state: .nickname
            )
            .padding(.horizontal, 16)
            
            Spacer()
            
            BasicButton(
                text: "다음",
                isActivated: !nickname.isEmpty
            ) {
                navigationManager.push(view: SignupDestination.schoolMajorInput)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar(showBackButton: true)
    }
}

#Preview {
    NicknameInputView()
}
