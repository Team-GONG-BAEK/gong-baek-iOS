//
//  GetOwnerInfoResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

struct GetOwnerInfoResponseDTO: Codable {
    var profileImg: Int
    var nickname: String
    var sex: String
    var schoolMajor: String
    var enterYear: Int
    var schoolGrade: Int
    var mbti: String
    var introduction: String
}
