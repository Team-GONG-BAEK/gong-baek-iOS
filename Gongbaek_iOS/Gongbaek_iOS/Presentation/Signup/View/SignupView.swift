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
    @State private var currentStepIndex: SignupStep = .profileSelection
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: currentStepIndex.rawValue)
            
            /// currentStepIndex에 따라 변경되는 View
            currentStepIndex.view(
                viewModel: viewModel,
                navigationManager: navigationManager
            )
            
            Spacer()
            
            if currentStepIndex == .freeTimeTableConversion {
                OnboardingConfirmBar(
                    grayButtonText: "시간표 변경",
                    orangeButtonText: "가입 완료",
                    onTapGrayButton: { pop() },
                    onTapOrangeButton: { push() }
                )
            } else {
                BasicButton(
                    text: "다음",
                    isActivated: viewModel.isNextButtonEnabled(currentStepIndex)
                ) {
                    push()
                    // 다음 뷰 뷰모델 변수 init
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)                
            }
        }
        .customNavigationBar(
            showBackButton:
                !(currentStepIndex == .profileSelection
                  || currentStepIndex == .signupCompletion),
            onBackButtonTap: {
                pop()
            }
        )
    }
}

extension SignupView {
    
    private func push() {
        currentStepIndex = .allCases[currentStepIndex.rawValue + 1]
    }
    
    private func pop() {
        currentStepIndex = .allCases[currentStepIndex.rawValue - 1]
    }
}

#Preview {
    SignupNavigationView()
}
