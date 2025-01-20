//
//  TimeTableModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/16/25.
//

import Foundation

struct TimeTableModel {
    let id: Int
    let weekDay: WeekDay
    let startTime: Double
    let endTime: Double
}

let dummyFreeTimeTable: [TimeTableModel] = [
    TimeTableModel(id: 0, weekDay: .MON, startTime: 9, endTime: 12),
    TimeTableModel(id: 1, weekDay: .MON, startTime: 14, endTime: 17.5),
    TimeTableModel(id: 1, weekDay: .MON, startTime: 14, endTime: 17.5),
    TimeTableModel(id: 2, weekDay: .TUE, startTime: 14, endTime: 18),
    TimeTableModel(id: 3, weekDay: .WED, startTime: 9, endTime: 11),
    TimeTableModel(id: 4, weekDay: .THU, startTime: 12, endTime: 13),
    TimeTableModel(id: 5, weekDay: .FRI, startTime: 13.5, endTime: 17.5),
]

let dummySelectedTimeRange: (start: Double, end: Double) = (0, 0)

