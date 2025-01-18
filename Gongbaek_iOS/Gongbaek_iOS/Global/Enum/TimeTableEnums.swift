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
    
    static func fromRawValue(_ rawValue: String) -> WeekDay? {
        return WeekDay.allCases.first {
            $0.rawValue == rawValue // 한글 요일 (월, 화, 수 등)
            || $0.englishName == rawValue // 영어 요일 (MON, TUE 등)
            || $0.fullName == rawValue // 한글 전체 이름 (월요일, 화요일 등)
        }
    }
    
    private static let fullNames: [WeekDay: String] = [
        .MON: "월요일",
        .TUE: "화요일",
        .WED: "수요일",
        .THU: "목요일",
        .FRI: "금요일"
    ]

    private static let englishNames: [WeekDay: String] = [
        .MON: "MON",
        .TUE: "TUE",
        .WED: "WED",
        .THU: "THU",
        .FRI: "FRI"
    ]
    
    var fullName: String {
        return WeekDay.fullNames[self] ?? self.rawValue
    }
    
    var englishName: String {
        return WeekDay.englishNames[self] ?? self.rawValue
    }
}


enum TimeTableCellState {
    case inactive
    case freeTime
    case active
}
