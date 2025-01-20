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
    // 학년입학연도 입력
    @Published var grade: GradeState? = nil
    @Published var yearOfAdmission: Int? = nil
    // MBTI 입력
    @Published var e_i: MBTI_ei? = nil
    @Published var s_n: MBTI_sn? = nil
    @Published var t_f: MBTI_tf? = nil
    @Published var j_p: MBTI_jp? = nil
    // 성별 선택
    @Published var sex: SexType? = nil
    // 자기소개글 작성
    @Published var introduction: String = ""
    // 수업시간표 입력
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    
    
    func isNextButtonEnabled(_ stepIndex: SignupStep) -> Bool {
        switch stepIndex {
        case .profileSelection:
            return profileImageIndex != nil
        case .nicknameInput:
            return !nickname.isEmpty
        case .schoolMajorInput:
            return !schoolName.isEmpty && !majorName.isEmpty
        case .gradeAdmissionYearInput:
            return grade != nil && yearOfAdmission != nil
        case .mbtiSelection:
            return e_i != nil && s_n != nil && t_f != nil && j_p != nil
        case .sexSelection:
            return sex != nil
        case .selfIntroductionWriting:
            return !introduction.isEmpty
        case .classTimeTableInput:
            return !selectedCells.isEmpty
        case .freeTimeTableConversion, .signupCompletion:
            return true
        }
    }
    
    /// 학교학과 검색 화면 프로퍼티 초기화
    func resetSearchState() {
        selectedSearchResult = ""
        textFieldText = ""
        searchWord = ""
        searchResultList = []
    }
}

extension SignupViewModel {
    
}
