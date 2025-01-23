//
//  GetJoinableMeetingListRes.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import Foundation

struct GetJoinableMeetingListResponseDTO: Codable {
    let meetingList: [JoinableMeetingModel]
}

struct JoinableMeetingModel: Codable {
    let groupId: Int
    let category: String
    let coverImg: Int
    let profileImg: Int
    let nickname: String
    let groupType: String
    let groupTitle: String
    let weekDay: String
    let weekDate: String
    let startTime: Double
    let endTime: Double
    let location: String
}
