//
//  EnterButtonState.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/27/25.
//

import Foundation

enum EnterButtonState {
    case space(GetUpcomingMeetingResponseDTO)
    case filling
    
    var title: String {
        switch self {
        case .space: "스페이스 입장"
        case .filling: "채우기 입장"
        }
    }
    
    var upcomingMeetingTitle: String {
        switch self {
        case .space(let data): data.groupTitle
        case .filling: "공백을 채워주세요!"
        }
    }
    
    var upcomingMeetingDate: String {
        switch self {
        case .space(let data):
            let date = Date.formatDate(data.weekDate)
            let weekday = WeekDay(data.weekDay)?.koreanName ?? ""
            let startTime = Date.formatTime(data.startTime)
            let endTime = Date.formatTime(data.endTime)
            return date + " " + weekday + " " + startTime + " - " + endTime
        case .filling:
            return "다가오는 모임이 없어요!"
        }
    }
}
