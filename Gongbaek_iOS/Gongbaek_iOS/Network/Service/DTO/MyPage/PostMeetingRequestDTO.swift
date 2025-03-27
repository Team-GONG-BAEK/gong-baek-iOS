//
//  PostMeetingRequestDTO.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import Foundation

struct PostMeetingRequestDTO: Codable {
    let groupType: String
    let weekDate: String
    let weekDay: String
    let startTime: Double
    let endTime: Double
    let category: String
    let coverImg: Int
    let location: String
    let maxPeopleCount: Int
    let groupTitle: String
    let introduction: String
}
