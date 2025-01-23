//
//  AddMeetingModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import Foundation

struct AddMeetingModel: Codable {
    var groupType: String
    var weekDate: String
    var weekDay: String
    var startTime: Double
    var endTime: Double
    var category: String
    var coverImg: Int
    var location: String
    var maxPeopleCount: Int
    var groupTitle: String
    var introduction: String
}

