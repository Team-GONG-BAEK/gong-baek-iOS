//
//  SignupView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

enum SignupStep: Int, CaseIterable {
    case profileSelection = 0
    case nicknameInput
    case schoolMajorInput
    case gradeAdmissionYearInput
    case mbtiSelection
    case sexSelection
    case selfIntroductionWriting
    case classTimeTableInput
    case freeTimeTableConversion
    case signupCompletion
    
    @ViewBuilder
    func view(
        viewModel: SignupViewModel,
        navigationManager: NavigationManager
    ) -> some View {
        switch self {
        case .profileSelection:
            ProfileSelectionView(viewModel: viewModel)
        case .nicknameInput:
            NicknameInputView(viewModel: viewModel)
        case .schoolMajorInput:
            SchoolMajorInputView(
                viewModel: viewModel,
                onTapSchoolSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .school))
                },
                onTapMajorSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .major))
                }
            )
        case .gradeAdmissionYearInput:
            GradeAdmissionYearInputView(viewModel: viewModel)
        case .mbtiSelection:
            MbtiSelectionView(viewModel: viewModel)
        case .sexSelection:
            SexSelectionView(viewModel: viewModel)
        case .selfIntroductionWriting:
            SelfIntroductionWritingView(viewModel: viewModel)
        case .classTimeTableInput:
            ClassTimeTableInputView(viewModel: viewModel)
        case .freeTimeTableConversion:
            FreeTimeTableConversionView(viewModel: viewModel)
        case .signupCompletion:
            // TODO: 회원가입 성공 화면 만들기
            MbtiSelectionView(viewModel: viewModel)
        }
    }
}

struct SignupView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @StateObject private var viewModel = SignupViewModel()
    @State private var currentStep: SignupStep = .profileSelection
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: currentStep.rawValue)
            
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
                    text: "다음",
                    isActivated: viewModel.isNextButtonEnabled(currentStep)
                ) {
                    /// 다음 뷰 기존 상태값 리셋
                    let nextStep = SignupStep.allCases[currentStep.rawValue + 1]
                    viewModel.resetState(at: nextStep)
                    push()
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
        currentStep = .allCases[currentStep.rawValue + 1]
    }
    
    private func pop() {
        currentStep = .allCases[currentStep.rawValue - 1]
    }
}

#Preview {
    SignupNavigationView()
}
