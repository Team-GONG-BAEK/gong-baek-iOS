//
//  GradeState.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import Foundation

enum ProfileImageMap: String, CaseIterable {
    case profile0 = "profile_image_0"
    case profile1 = "profile_image_1"
    case profile2 = "profile_image_2"
    case profile3 = "profile_image_3"
    case profile4 = "profile_image_4"
    case profile5 = "profile_image_5"
}

enum GradeState: String, CaseIterable {
    case one = "1학년"
    case two = "2학년"
    case three = "3학년"
    case four = "4학년"
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
    case e = "E"
    case i = "I"
}

enum MBTI_sn: String, CaseIterable {
    case s = "S"
    case n = "N"
}

enum MBTI_tf: String, CaseIterable {
    case t = "T"
    case f = "F"
}

enum MBTI_jp: String, CaseIterable {
    case j = "J"
    case p = "P"
}
