//
//  WeekFullDay.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum WeekFullDay: String, CaseIterable {
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    
    private static let koreanNames: [WeekFullDay: String] = [
        .monday: "월요일",
        .tuesday: "화요일",
        .wednesday: "수요일",
        .thursday: "목요일",
        .friday: "금요일"
    ]
    
    var displayName: String {
        return WeekFullDay.koreanNames[self] ?? self.rawValue
    }
    
    static func fromRawValue(_ rawValue: String) -> WeekFullDay? {
        return WeekFullDay(rawValue: rawValue)
    }
}
