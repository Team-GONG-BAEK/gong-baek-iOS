//
//  PostSignupRequestDTO.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import Foundation

struct PostSignupRequestDTO: Codable {
    let profileImg: Int
    let nickname: String
    let mbti: String
    let schoolName: String
    let schoolMajor: String
    let schoolGrade: Int
    let enterYear: Int
    let introduction: String
    let sex: String
    let timeTable: [TimeTableRequestModel]
}

struct TimeTableRequestModel: Codable {
    let weekDay: String
    let startTime: Double
    let endTime: Double
}
