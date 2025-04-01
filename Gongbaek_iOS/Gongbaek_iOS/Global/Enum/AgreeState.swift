//
//  AgreeState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/27/25.
//

import Foundation

enum AgreeState {
    case terms
    case privacy

}

extension AgreeState {
    
    var titleText: String {
        switch self {
        case .terms: return "[필수] 서비스 이용약관"
        case .privacy: return "[필수] 개인정보 처리 방침"
        }
    }
    
    var webURL: URL {
        switch self {
        case .terms:
            return URL(string: "https://www.naver.com")!
        case .privacy:
            return URL(string: "https://www.naver.com")!
        }
    }
    
}
