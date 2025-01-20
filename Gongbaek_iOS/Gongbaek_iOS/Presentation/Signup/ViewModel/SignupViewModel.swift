//
//  SignupViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

final class SignupViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // 프로필 선택
    @Published var profileImageIndex: Int? = nil
    // 닉네임 입력
    @Published var nickname = ""
    @Published var showNicknameError = false
    // 학교학과 입력
    @Published var schoolName = ""
    @Published var majorName = ""
    // 학교학과 검색
    @Published var selectedSearchResult: String = ""
    @Published var textFieldText = ""
    @Published var searchWord = ""
    @Published var searchResultList: [String] = []
    
    func isNextButtonEnabled(_ stepIndex: SignupStep) -> Bool {
        switch stepIndex {
        case .profileSelection:
            return profileImageIndex != nil
        case .nicknameInput:
            return !nickname.isEmpty
        case .schoolMajorInput:
            return !schoolName.isEmpty && !majorName.isEmpty
//        case .gradeAdmissionYearInput: return schoolGrade != nil && enterYear != nil
//        case .mbtiSelection: return !mbti.isEmpty
//        case .sexSelection: return sex != nil
//        case .selfIntroductionWriting: return !introduction.isEmpty
//        case .classTimeTableInput: return !timeTable.isEmpty
//        case .freeTimeTableConversion, .signupCompletion: return true
        default: return false
        }
    }
}
