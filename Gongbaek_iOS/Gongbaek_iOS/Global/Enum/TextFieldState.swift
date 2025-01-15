//
//  TextFieldState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum TextFieldState {
    case nickname
    case location
    case title
}

extension TextFieldState {
    var titleText: String {
        switch self {
        case .nickname: return "닉네임"
        case .location: return "장소"
        case .title: return "제목"
        }
    }
    
    var placeholderText: String {
        switch self {
        case .nickname: return "한글을 활용해 최대 8자 이내로 입력해주세요."
        case .location: return "모임 장소를 입력해주세요. ex) M동 1층 로비"
        case .title: return "모임 제목을 입력해주세요."
        }
    }
    
    var maxCharacterCount: Int {
        switch self {
        case .nickname: return 8
        case .location, .title: return 20
        }
    }
}
