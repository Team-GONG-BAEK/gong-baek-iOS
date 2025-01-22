//
//  SignupView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @StateObject private var viewModel = SignupViewModel()
    @State private var currentStep: SignupStep = .profileSelection
    
    var body: some View {
        VStack(spacing: 0) {
            if currentStep != .signupCompletion {            
                ProgressBar(currentIndex: currentStep.rawValue)
            }
            
            /// currentStepIndex에 따라 변경되는 View
            currentStep.view(
                viewModel: viewModel,
                navigationManager: navigationManager
            )
            
            Spacer()
            
            if currentStep == .freeTimeTableConversion {
                OnboardingConfirmBar(
                    grayButtonText: "시간표 변경",
                    orangeButtonText: "가입 완료",
                    onTapGrayButton: { pop() },
                    onTapOrangeButton: { push() }
                )
            } else {
                BasicButton(
                    text: currentStep == .signupCompletion
                    ? "공백 채우러 가기" : "다음",
                    isActivated: viewModel.isNextButtonEnabled(currentStep)
                ) {
                    if currentStep == .nicknameInput {
                        validateNickname()
                    } else {
                        push()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)                
            }
        }
        .customNavigationBar(
            showBackButton:
                !(currentStep == .profileSelection
                  || currentStep == .signupCompletion),
            onBackButtonTap: {
                pop()
            }
        )
    }
}

extension SignupView {
    
    private func push() {
        /// 다음 뷰 기존 상태값 리셋
        let nextStep = SignupStep.allCases[currentStep.rawValue + 1]
        viewModel.resetState(at: nextStep)
        currentStep = nextStep
    }
    
    private func pop() {
        currentStep = .allCases[currentStep.rawValue - 1]
    }
}

extension SignupView {
    
    private func validateNickname() {
        viewModel.postNicknameValidation { isSuccess in
            if isSuccess {
                viewModel.showNicknameError = false
                push()
            }
            else {
                viewModel.showNicknameError = true
            }
        }
    }
}

#Preview {
    SignupNavigationView()
}
