//
//  PostSignupRequestDTO.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import Foundation

struct PostSignupRequestDTO: Codable {
    let platform: String
    let profileImg: Int
    let nickname: String
    let mbti: String
    let email: String
    let schoolName: String
    let schoolMajor: String
    let enterYear: Int
    let introduction: String
    let sex: String
    let timeTable: [ClassTimeSlot]
}

struct ClassTimeSlot: Codable {
    var weekDay: String
    var startTime: Double
    var endTime: Double
}
