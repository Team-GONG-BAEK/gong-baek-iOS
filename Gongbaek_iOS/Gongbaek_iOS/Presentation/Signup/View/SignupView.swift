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
    @State private var currentStep: SignupStep = .academicInfoInput
    @State private var showYearPicker = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if currentStep != .signupCompletion {
                    ProgressBar(currentIndex: currentStep.rawValue)
                }
                
                /// currentStepIndex에 따라 변경되는 View
                currentStep.view(
                    viewModel: viewModel,
                    navigationManager: navigationManager,
                    showYearPicker: $showYearPicker
                )
                
                Spacer()
                
                BasicButton(
                    text: currentStep == .signupCompletion
                    ? "공백 채우러 가기" : (currentStep == .classTimeTableInput ? "가입 완료" : "다음"),
                    isActivated: viewModel.isNextButtonEnabled(currentStep)
                ) {
                    switch currentStep {
                    case .nicknameSexInput:
                        validateNickname()
                    case .classTimeTableInput:
                        signup()
                    case .signupCompletion:
                        goToTabBarView()
                    default:
                        goToNextStep()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
            
            .onTapGesture {
                hideKeyboard()
            }
            .customNavigationBar(
                showBackButton: !(currentStep == .signupCompletion),
                onBackButtonTap: {
                    goBackToPreviousStep()
                }
            )
            
            if showYearPicker {
                ZStack {
                    Color.black.opacity(0.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showYearPicker = false
                            }
                        }
                    
                    YearSelectBottomSheet(
                        viewModel: viewModel,
                        showBottomSheet: $showYearPicker
                    )
                    .transition(.move(edge: .bottom))
                }
            }
            
            if viewModel.showAlert {
                CustomedAlert(
                    alertImage: "img_fail" ,
                    titleText: currentStep == .classTimeTableInput ? "앗! 회원가입에 실패했어요." : "앗! 오류가 발생했어요.",
                    subtitleText: "다시 시도해주세요.",
                    orangeButtonText: "확인",
                    onTapOrangeButton: {
                        viewModel.showAlert = false
                    }
                )
            }
        }
    }
}

extension SignupView {
    
    private func goToNextStep() {
        /// 다음 뷰 기존 상태값 리셋
        if currentStep != .signupCompletion {
            let nextStep = SignupStep.allCases[currentStep.rawValue + 1]
            viewModel.resetState(at: nextStep)
            currentStep = nextStep
        }
    }
    
    private func goBackToPreviousStep() {
        if currentStep == .academicInfoInput {
            navigationManager.pop()
        } else {
            currentStep = .allCases[currentStep.rawValue - 1]
        }
    }
    
    private func goToTabBarView() {
        withAnimation(.easeInOut(duration: 0.3)) {
            navigationManager.rootView = .tabBar
        }
    }
}

/// API Functions
extension SignupView {
    
    private func validateNickname() {
        if !viewModel.isOnlyCompleteHangulSyllables(viewModel.nickname) {
            viewModel.nicknameStatus = .invalidNicknameFormat
            return
        }
        
        viewModel.postNicknameValidation { isSuccess in
            if isSuccess {
                goToNextStep()
            }
        }
    }
    
    private func signup() {
        viewModel.postSignup() { isSuccess in
            if isSuccess {
                goToNextStep()
            }
        }
    }
}
