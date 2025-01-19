//
//  NavigationDestination.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

enum SignupDestination: Hashable {
    case profileSelection
    case nicknameInput
    case schoolMajorInput
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .profileSelection:
            ProfileSelectionView()
        case .nicknameInput:
            Text("nicknameInput")
        case .schoolMajorInput:
            Text("schoolMajorInput")
        }
    }
}

enum FillingDestination: Hashable {
    case addMeeting
    case calendarSelect
    case weekDaySelect
    case timeSelect
    case categorySelect
    case coverImageSelect
    case locationInput
    case introduceInput
    case checkInputInfo
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .addMeeting:
            AddMeetingView()
        case .calendarSelect:
            CalendarSelectView()
        case .weekDaySelect:
            WeekDaySelect()
        case .timeSelect:
            TimeSelect()
        case .categorySelect:
            CategorySelect()
        case .coverImageSelect:
            CoverImageSelect()
        case .locationInput:
            LocationInput(showError: false, isFocused: false)
        case .introduceInput:
            IntroduceInput(showError: false, isFocused: false)
        case .checkInputInfo:
            CheckInputInfo()
        }
    }
}

enum MyFillingDestination: Hashable {
    // TODO: 나의채움 모든 화면 작성
}

enum HomeDestination: Hashable {
    // TODO: 홈화면 모든 화면 작성
}
