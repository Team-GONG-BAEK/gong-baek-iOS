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
    // 검색 화면 내비게이션 프레젠트 전환
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
                onSchoolSearchButtonTap: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .school))
                },
                onMajorSearchButtonTap: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .major))
                }
            )
        case .gradeAdmissionYearInput:
            GradeAdmissionYearInputView()
        case .mbtiSelection:
            MbtiSelectionView()
        case .sexSelection:
            SexSelectionView()
        case .selfIntroductionWriting:
            SelfIntroductionWritingView()
        case .classTimeTableInput:
            ClassTimeTableInputView()
        case .freeTimeTableConversion:
            SexSelectionView()
//            FreeTimeTableConversionView()
        case .signupCompletion:
            // TODO: 회원가입 성공 화면 만들기
            SexSelectionView()
        }
    }
}

struct SignupView: View {
    @EnvironmentObject private var navigationManager: NavigationManager
    @StateObject private var viewModel = SignupViewModel()
    @State private var stepIndex: SignupStep = .profileSelection
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: stepIndex.rawValue)
            
            stepIndex.view(viewModel: viewModel, navigationManager: navigationManager)
            
            Spacer()
            
            BasicButton(
                text: "다음",
                isActivated: viewModel.isNextButtonEnabled(stepIndex)
            ) {
                stepIndex = .allCases[stepIndex.rawValue + 1]
                
                // 해당 뷰 뷰모델 변수 init
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar(
            showBackButton:
                !(stepIndex == .profileSelection
                  || stepIndex == .signupCompletion),
            onBackButtonTap: {
                // 다음버튼 활성화
                stepIndex = .allCases[stepIndex.rawValue - 1]
            }
        )
    }
}

#Preview {
    SignupNavigationView()
}
