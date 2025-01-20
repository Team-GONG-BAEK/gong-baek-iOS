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
    func view(viewModel: SignupViewModel) -> some View {
        switch self {
        case .profileSelection:
            ProfileSelectionView(viewModel: viewModel)
        case .nicknameInput:
            NicknameInputView()
        case .schoolMajorInput:
            SchoolMajorInputView()
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
            
            stepIndex.view(viewModel: viewModel)
            
            Spacer()
            
            BasicButton(
                text: "다음",
                isActivated: viewModel.isNextButtonEnabled(stepIndex)
            ) {
                stepIndex = .allCases[stepIndex.rawValue + 1]
                
                // 해당 뷰 뷰모델 변수 init
                
                // 검색 화면
//                navigationManager.push(view: SignupDestination.nicknameInput)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar(
            // 뒤로가기 버튼 인덱스 -1 처리
            // 다음버튼 활성화
            showBackButton:
                !(stepIndex == .profileSelection
            || stepIndex == .signupCompletion)
        )
    }
}

#Preview {
    SignupView()
}
