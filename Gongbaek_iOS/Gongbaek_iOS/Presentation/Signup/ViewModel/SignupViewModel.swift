//
//  SignupViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

final class SignupViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // ProfileSelection
    @Published var selectedProfileImageIndex: Int? = nil
    
    
    func isNextButtonEnabled(_ stepIndex: SignupStep) -> Bool {
        switch stepIndex {
        case .profileSelection:
            return selectedProfileImageIndex != nil
//        case .schoolMajorInput: return !schoolName.isEmpty && !schoolMajor.isEmpty
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
