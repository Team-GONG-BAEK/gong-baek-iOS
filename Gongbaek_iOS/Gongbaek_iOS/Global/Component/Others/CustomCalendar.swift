//
//  CustomCalendar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct CustomCalendar: View {
    @State private var month: Date = Date()
    @Binding private var selectedDate: Date?
    
    var today: Date {
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: now)
        return Calendar.current.date(from: components)!
    }
    
    static let calendarHeaderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()
    
    static let weekdaySymbols: [String] = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.veryShortWeekdaySymbols
    }()
    
    init(
        month: Date = Date(),
        selectedDate: Binding<Date?>
    ) {
        _month = State(initialValue: month)
        _selectedDate = selectedDate
    }
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Button(
                    action: {
                        changeMonth(by: -1)
                    }) {
                        Image(.icArrowLeft32)
                            .foregroundColor(.gray04)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(false)
                
                Text(month, formatter: Self.calendarHeaderDateFormatter)
                    .pretendardFont(.title2_sb_18)
                
                Button(
                    action: {
                        changeMonth(by: 1)
                    }) {
                        Image(.icArrowRight32)
                            .foregroundColor(.gray04)
                            .frame(width: 32, height: 32)
                    }
                    .disabled(false)
            }
            .padding(.bottom, 24)
            
            HStack {
                ForEach(Self.weekdaySymbols.indices, id: \.self) { index in
                    let symbol = Self.weekdaySymbols[index]
                    Text(symbol)
                        .pretendardFont(.body1_sb_16)
                        .foregroundColor(.gray06)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 28)
        }
    }
    
    private var calendarGridView: some View {
        // 현재 달 날짜수
        let daysInMonth = numberOfDays(in: month)
        // 현재 달의 첫 요일 인덱스
        let firstWeekday = firstWeekdayOfMonth(in: month) - 1
        // 이전 달의 날짜수 == 마지막 날짜
        let lastDayOfMonthBefore = numberOfDays(in: previousMonth())
        // 현재 달력 행 개수
        let numberOfRows = Int(ceil(Double(daysInMonth + firstWeekday) / 7.0))
        // 다음 달 보이는 날짜들 = 달력에 보이는 전체 날짜수 - 현재 달 날짜수 - 현재 달 첫 요일 인덱스
        let visibleDaysOfNextMonth = numberOfRows * 7 - (daysInMonth + firstWeekday)
        
        return LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 24) {
            // -firstWeekday == 현재 달력에 보이는 이전 달 날짜수
            // 즉, 이전 달 날짜수부터 (현재 달 날짜수 + 보이는 다음달 날짜수)까지를 인덱스로 For문 돌림
            // 현재 달의 1일 인덱스 == 0인 것
            ForEach(-firstWeekday ..< daysInMonth + visibleDaysOfNextMonth, id: \.self) { index in
                Group {
                    // 현재 달의 날짜인 경우
                    if index > -1 && index < daysInMonth {
                        let date = getDate(for: index)
                        let day = Calendar.current.component(.day, from: date)
                        let weekday = Calendar.current.component(.weekday, from: date)
                        // 현재 선택한 날짜인지 여부
                        let clicked = selectedDate == date
                        // 오늘인지 여부
                        let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
                        // 과거 날짜인지 여부
                        let isPast = date < today
                        
                        CalendarCell(
                            day: day,
                            clicked: clicked,
                            isToday: isToday,
                            isCurrentMonthDay: true,
                            isDisabled: isWeekend(weekday) || isPast
                        )
                        .onTapGesture {
                            // 주말, 과거가 아닌 경우
                            if !isWeekend(weekday) && !isPast {
                                selectedDate = date
                            }
                        }
                    }
                    // 인덱스가 음수인 경우
                    // 이전 달 1일에 이전 달 마지막 날짜(==이전 달 날짜수) + 인덱스 더한 값이 이전 달에 해당되는지 여부
                    // (e.g) 1 + 31 + (-2) = 31 ⭕️ - 이전 달
                    // (e.g) 1 + 31 + (32) = 64 ❌ - 다음 달
                    // 즉, 현재 달력에 보일 이전 달 날짜들을 보여주기 위함
                    else if let prevMonthDate = Calendar.current.date(
                        byAdding: .day,
                        value: index + lastDayOfMonthBefore,
                        to: previousMonth()
                    ) {
                        let day = Calendar.current.component(.day, from: prevMonthDate)
                        
                        CalendarCell(
                            day: day,
                            isDisabled: true
                        )
                    }
                }
            }
        }
    }
    
    // 주말인지 판단. 1이면 일요일, 7이면 토요일
    private func isWeekend(_ weekday: Int) -> Bool {
        return weekday == 1 || weekday == 7
    }
}

private struct CalendarCell: View {
    private var day: Int
    private var clicked: Bool
    private var isToday: Bool
    private var isCurrentMonthDay: Bool
    private var isDisabled: Bool
    
    private var textColor: Color {
        return getTextColor()
    }
    
    private var backgroundColor: Color {
        return getBackgroundColor()
    }
    
    fileprivate init(
        day: Int,
        clicked: Bool = false,
        isToday: Bool = false,
        isCurrentMonthDay: Bool = true,
        isDisabled: Bool = false
    ) {
        self.day = day
        self.clicked = clicked
        self.isToday = isToday
        self.isCurrentMonthDay = isCurrentMonthDay
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .overlay(
                Text(String(day))
                    .pretendardFont(.body1_m_16)
            )
            .foregroundColor(textColor)
            .frame(height: 28)
    }
    
    private func getTextColor() -> Color {
        switch (isDisabled, clicked, isToday, isCurrentMonthDay) {
        case (true, _, _, _): return .gray04
        case (_, true, _, _): return .grayWhite
        case (_, _, true, _): return .mainOrange
        case (_, _, _, true): return .grayBlack
        default: return .gray04
        }
    }
    
    private func getBackgroundColor() -> Color {
        return clicked ? .mainOrange : .white
    }
}

extension CustomCalendar {
    
    func getDate(for index: Int) -> Date {
        let calendar = Calendar.current
        guard let firstDayOfMonth = calendar.date(
            from: DateComponents(
                year: calendar.component(.year, from: month),
                month: calendar.component(.month, from: month),
                day: 1
            )
        ) else {
            return Date()
        }
        
        var dateComponents = DateComponents()
        dateComponents.day = index
        
        let timeZone = TimeZone.current
        let offset = Double(timeZone.secondsFromGMT(for: firstDayOfMonth))
        dateComponents.second = Int(offset)
        
        let date = calendar.date(byAdding: dateComponents, to: firstDayOfMonth) ?? Date()
        return date
    }
    
    func numberOfDays(in date: Date) -> Int {
        return Date.numberOfDays(in: date)
    }
    
    func firstWeekdayOfMonth(in date: Date) -> Int {
        return Date.firstWeekdayOfMonth(in: date)
    }
    
    func previousMonth() -> Date {
        return Date.previousMonth(from: month)
    }
    
    func adjustedMonth(by value: Int) -> Date {
        return Date.adjustedMonth(from: month, by: value)
    }
    
    func changeMonth(by value: Int) {
        self.month = adjustedMonth(by: value)
    }
}
