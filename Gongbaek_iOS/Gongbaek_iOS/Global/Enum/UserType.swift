//
//  UserType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 4/7/25.
//

import Foundation

// 로그인 시 유저 타입 분류
enum UserType {
    case none
    case newUser // 최초 회원가입하는 유저
    case existingUser // 이미 가입 후 존재하는 유저
}
