//
//  WeekFullDay.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum WeekFullDay: String {
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    case saturday = "SAT"
    case sunday = "SUN"
    
    var displayName: String {
        switch self {
        case .monday: return "월요일"
        case .tuesday: return "화요일"
        case .wednesday: return "수요일"
        case .thursday: return "목요일"
        case .friday: return "금요일"
        case .saturday: return "토요일"
        case .sunday: return "일요일"
        }
    }
    
    static func fromRawValue(_ rawValue: String) -> WeekFullDay? {
        return WeekFullDay(rawValue: rawValue)
    }
}
