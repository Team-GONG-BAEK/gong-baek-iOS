//
//  TextFieldType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

protocol TextFieldErrorStatus {
    var message: String { get }
    var isError: Bool { get }
}

enum TextFieldType {
    case nickname
    case location
    case title
    case schoolEmail
    case verificationCode
    
    enum NicknameStatus: String, TextFieldErrorStatus {
        case duplicatedNickname = "중복된 닉네임입니다. 다시 입력해주세요."
        
        var message: String { rawValue }
        var isError: Bool {
            switch self {
            case .duplicatedNickname: return true
            }
        }
    }
    
    enum EmailStatus: String, TextFieldErrorStatus {
        case invalidEmailFormat = "잘못된 이메일입니다. 다시 입력해주세요."
        case codeSent = "인증코드를 발송했습니다."
        
        var message: String { rawValue }
        var isError: Bool {
            switch self {
            case .invalidEmailFormat: return true
            case .codeSent: return false
            }
        }
    }
    
    enum VerificationStatus: String, TextFieldErrorStatus {
        case invalidCode = "잘못된 코드입니다. 다시 입력해주세요."
        case verificationCompleted = "코드 인증이 완료되었습니다."
        case expiredCode = "유효기간이 만료되었습니다. 코드를 다시 받아주세요."
        
        var message: String { rawValue }
        var isError: Bool {
            switch self {
            case .invalidCode: return true
            case .verificationCompleted: return false
            case .expiredCode: return true
            }
        }
    }
}

extension TextFieldType {
    var titleText: String {
        switch self {
        case .nickname: return "닉네임"
        case .location: return "장소"
        case .title: return "제목"
        case .schoolEmail: return "이메일 주소"
        case .verificationCode: return "코드"
        }
    }
    
    var placeholderText: String {
        switch self {
        case .nickname: return "한글을 활용해 최대 8자 이내로 입력해주세요."
        case .location: return "모임 장소를 입력해주세요. ex) M동 1층 로비"
        case .title: return "모임 제목을 입력해주세요."
        case .schoolEmail: return "학교 이메일을 입력해주세요."
        case .verificationCode: return "코드를 입력해주세요."
        }
    }
    
    var maxCharacterCount: Int {
        switch self {
        case .nickname: return 8
        case .location, .title: return 20
        case .verificationCode: return 6
        default: return 0
        }
    }
}
