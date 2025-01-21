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
    case error
    
    init(from serverValue: String) {
        switch serverValue.uppercased() {
        case "MON":
            self = .MON
        case "TUE":
            self = .TUE
        case "WED":
            self = .WED
        case "THU":
            self = .THU
        case "FRI":
            self = .FRI
        default:
            self = .error
        }
    }
    
    private static let koreanNames: [WeekDay: String] = [
        .MON: "월요일",
        .TUE: "화요일",
        .WED: "수요일",
        .THU: "목요일",
        .FRI: "금요일"
    ]
    
    var koreanName: String {
        return WeekDay.koreanNames[self] ?? self.rawValue
    }
    
    private static let englishNames: [WeekDay: String] = [
        .MON: "MON",
        .TUE: "TUE",
        .WED: "WED",
        .THU: "THU",
        .FRI: "FRI"
    ]
    
    
    var englishName: String {
        return WeekDay.englishNames[self] ?? self.rawValue
    }
    
    static func fromRawValue(_ rawValue: String) -> WeekDay? {
        return WeekDay.allCases.first {
            $0.rawValue == rawValue || // "월", "화", "수"와 같은 기본값
            $0.koreanName == rawValue || // "월요일", "화요일", "수요일"
            $0.englishName == rawValue // "MON", "TUE", "WED"
        }
    }
    
    static func fromWeekdayIndex(_ index: Int) -> WeekDay? {
        switch index {
        case 2: return .MON
        case 3: return .TUE
        case 4: return .WED
        case 5: return .THU
        case 6: return .FRI
        default: return nil // 주말 제외
        }
    }
}


enum TimeTableCellState {
    case inactive
    case freeTime
    case active
}
