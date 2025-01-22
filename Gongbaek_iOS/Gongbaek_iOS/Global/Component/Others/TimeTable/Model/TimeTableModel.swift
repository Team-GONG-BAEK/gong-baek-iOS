//
//  TimeTableModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/16/25.
//

import Foundation

struct TimeTableModel: Codable, Identifiable {
    let id: Int
    let weekDate: String
    let startTime: Double
    let endTime: Double

    enum CodingKeys: String, CodingKey {
        case id = "idx"
        case weekDate
        case startTime
        case endTime
    }
    
    var weekDayEnum: WeekDay? {
        return WeekDay(rawValue: weekDate)
    }
}

struct TimeRange: Equatable {
    var start: Double
    var end: Double
}

