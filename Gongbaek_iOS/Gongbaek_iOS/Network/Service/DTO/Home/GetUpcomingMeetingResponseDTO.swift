//
//  GetUpcomingMeetingResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/13/25.
//

import Foundation

struct GetUpcomingMeetingResponseDTO: Codable {
    let groupId: Int
    let category: String
    let groupType: String
    let groupTitle: String
    let weekDay: String
    let weekDate: String
    let currentPeopleCount: Int
    let maxPeopleCount: Int
    let startTime: Double
    let endTime: Double
    let location: String
}
