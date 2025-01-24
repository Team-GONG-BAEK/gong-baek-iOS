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
    @State private var showLottie = false
    
    var body: some View {
        if showLottie {
            LottieView(animationName: "timetable", loopMode: .playOnce)
                .ignoresSafeArea(edges: [.horizontal, .bottom])
                .scaledToFill()
        } else {
            ZStack {
                
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
                            onTapGrayButton: { goBackToPreviousStep() },
                            onTapOrangeButton: { signup() }
                        )
                    } else {
                        BasicButton(
                            text: currentStep == .signupCompletion
                            ? "공백 채우러 가기" : "다음",
                            isActivated: viewModel.isNextButtonEnabled(currentStep)
                        ) {
                            if currentStep == .nicknameInput {
                                validateNickname()
                            } else if currentStep == .signupCompletion {
                                goToTabBarView()
                            } else {
                                goToNextStep()
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 20)
                    }
                }
                .onChange(of: currentStep) { oldValue, newValue in
                    if newValue == .freeTimeTableConversion {
                        showLottieAnimation()
                    }
                }
                .customNavigationBar(
                    showBackButton:
                        !(currentStep == .profileSelection
                          || currentStep == .freeTimeTableConversion
                          || currentStep == .signupCompletion),
                    onBackButtonTap: {
                        goBackToPreviousStep()
                    }
                )
                
                if viewModel.showAlert {
                    CustomedAlert(
                        alertImage: "img_fail" ,
                        titleText: "앗! 데이터를 불러오지 못했어요.",
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
        currentStep = .allCases[currentStep.rawValue - 1]
    }
    
    private func goToTabBarView() {
        withAnimation(.easeInOut(duration: 0.3)) {
            navigationManager.rootView = .tabBar
        }
    }
    
    private func showLottieAnimation() {
        showLottie = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showLottie = false
            }
        }
    }
}

/// API Functions
extension SignupView {
    
    private func validateNickname() {
        viewModel.postNicknameValidation { isSuccess in
            if isSuccess {
                viewModel.showNicknameError = false
                goToNextStep()
            }
            else {
                viewModel.showNicknameError = true
            }
        }
    }
    
    private func signup() {
        viewModel.postSignup() { isSuccess in
            if isSuccess {
                goToNextStep()
            } else {
                // TODO: 에러대응 뷰
            }
        }
    }
}

#Preview {
    SignupNavigationView()
}
