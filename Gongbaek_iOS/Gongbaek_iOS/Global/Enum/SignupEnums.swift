//
//  SignupEnums.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

enum SignupStep: Int, CaseIterable {
    case academicInfoInput = 0
    case schoolEmailVerification
    case nicknameSexInput
    case profileImageSelection
    case mbtiSelection
    case selfIntroductionWriting
    case classTimeTableInput
    case signupCompletion
    
    @ViewBuilder
    func view(
        viewModel: SignupViewModel,
        navigationManager: NavigationManager,
        showYearPicker: Binding<Bool>
    ) -> some View {
        switch self {
        case .academicInfoInput:
            AcademicInfoInputView(
                viewModel: viewModel,
                showYearPicker: showYearPicker,
                onTapSchoolSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .school))
                },
                onTapMajorSearchButton: {
                    viewModel.resetSearchState()
                    navigationManager.present(.schoolMajorSearchView(viewModel, .major))
                }
            )
        case .schoolEmailVerification:
            SchoolEmailVerificationView(viewModel: viewModel)
        case .profileImageSelection:
            ProfileImageSelectionView(viewModel: viewModel)
        case .nicknameSexInput:
            NicknameSexInputView(viewModel: viewModel)
        case .mbtiSelection:
            MbtiSelectionView(viewModel: viewModel)
        case .selfIntroductionWriting:
            SelfIntroductionWritingView(viewModel: viewModel)
        case .classTimeTableInput:
            ClassTimeTableInputView(viewModel: viewModel)
        case .signupCompletion:
            SignupCompletionView()
        }
    }
}

enum MBTI {
    case ei
    case sn
    case tf
    case jp
    
    var text: String {
        switch self {
        case .ei: "외항형/내향형"
        case .sn: "감각형/직관형"
        case .tf: "사고형/감정형"
        case .jp: "판단형/인식형"
        }
    }
}

enum MBTI_ei: String, CaseIterable {
    case E
    case I
}

enum MBTI_sn: String, CaseIterable {
    case S
    case N
}

enum MBTI_tf: String, CaseIterable {
    case T
    case F
}

enum MBTI_jp: String, CaseIterable {
    case J
    case P
}

enum SexType: String, CaseIterable {
    case MAN
    case WOMAN
    
    var text: String {
        switch self {
        case .MAN: "남자"
        case .WOMAN: "여자"
        }
    }
}
