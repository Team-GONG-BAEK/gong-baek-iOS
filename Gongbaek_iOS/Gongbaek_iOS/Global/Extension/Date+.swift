//
//  Date+.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

extension Date {
    
    static let calendarDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy dd"
        return formatter
    }()
    
    var formattedCalendarDayDate: String {
        return Date.calendarDayDateFormatter.string(from: self)
    }
    
    static func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    static func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    static func previousMonth(from date: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: firstDayOfMonth)!
        return previousMonth
    }
    
    static func adjustedMonth(from date: Date, by value: Int) -> Date {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: date) {
            return newMonth
        }
        return date
    }
    
    // 날짜와 시간을 포맷팅하는 함수
    static func formattedDateAndTime(weekDay: WeekDay?, weekDate: String?, time: Double) -> String { // endTime도 필요
        let formattedTime = formatTime(time)
        
        if let weekDay = weekDay {
            return "매주 \(weekDay.koreanName) \(formattedTime)"
        } else if let weekDate = weekDate {
            let formattedDate = formatDate(weekDate)
            return "\(formattedDate) \(formattedTime)"
        }
        
        return "시간 정보 없음"
    }
    
    // 날짜와 시간을 포맷팅하는 함수
    static func formattedDateAndStartEndTime(weekDay: WeekDay?, weekDate: String?, startTime: Double, endTime: Double) -> String {
        let formattedStartTime = formatTime(startTime)
        let formattedEndTime = formatTime(endTime)
        
        if let weekDate = weekDate { // ✅ weekDate 값이 있으면 우선적으로 사용
            let formattedDate = formatDate(weekDate)
            return "\(formattedDate) \(formattedStartTime) - \(formattedEndTime)"
        } else if let weekDay = weekDay { // ✅ weekDate가 없으면 weekDay 사용
            return "매주 \(weekDay.koreanName) \(formattedStartTime) - \(formattedEndTime)"
        }
        
        return "시간 정보 없음"
    }

    
    // 댓글에 사용되는 시간 변경 로직
    static func formattedCommentDateTime(_ createdAt: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd-HH:mm"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "M/d   HH:mm"
        
        guard let date = inputFormatter.date(from: createdAt) else {
            return "변환 실패"
        }
        
        return outputFormatter.string(from: date)
    }

    // 시간 포맷 함수
    static func formatTime(_ time: Double) -> String {
        let hours = Int(time)
        let minutes = Int((time - Double(hours)) * 60)
        return minutes == 0 ? "\(hours)시" : "\(hours)시 \(minutes)분"
    }
    
    // 날짜 포맷 함수
    static func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        formatter.dateFormat = "M/d"
        return formatter.string(from: date)
    }
    
    static func currentYear(asString: Bool = false) -> Any {
        let year = Calendar.current.component(.year, from: Date())
        return asString ? "\(year)" : year
    }
    
}
