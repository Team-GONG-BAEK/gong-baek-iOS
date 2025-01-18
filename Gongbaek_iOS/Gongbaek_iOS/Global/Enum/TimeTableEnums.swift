//
//  TimeTableEnums.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/16/25.
//

import Foundation

enum WeekDay: String, CaseIterable {
    case MON = "월"
    case TUE = "화"
    case WED = "수"
    case THU = "목"
    case FRI = "금"
}

enum TimeTableCellState {
    case inactive
    case freeTime
    case active
}
