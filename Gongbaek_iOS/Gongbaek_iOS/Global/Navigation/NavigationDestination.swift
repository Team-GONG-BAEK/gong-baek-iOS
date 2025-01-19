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

enum FillingDestination: Hashable, CaseIterable {
    case addMeeting
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .addMeeting:
            AddMeetingView()
        }
    }
}

enum AddMeetingDestination: Hashable {
    case calendarSelect(viewModel: AddMeetingViewModel)
    case weekDaySelect(viewModel: AddMeetingViewModel)
    case timeSelect(viewModel: AddMeetingViewModel)
    case categorySelect(viewModel: AddMeetingViewModel)
    case coverImageSelect(viewModel: AddMeetingViewModel)
    case locationInput(viewModel: AddMeetingViewModel)
    case introduceInput(viewModel: AddMeetingViewModel)
    case checkInputInfo(viewModel: AddMeetingViewModel)
    
    static func == (lhs: AddMeetingDestination, rhs: AddMeetingDestination) -> Bool {
        switch (lhs, rhs) {
        case (.calendarSelect(let lhsViewModel), .calendarSelect(let rhsViewModel)),
             (.weekDaySelect(let lhsViewModel), .weekDaySelect(let rhsViewModel)),
             (.timeSelect(let lhsViewModel), .timeSelect(let rhsViewModel)),
             (.categorySelect(let lhsViewModel), .categorySelect(let rhsViewModel)),
             (.coverImageSelect(let lhsViewModel), .coverImageSelect(let rhsViewModel)),
             (.locationInput(let lhsViewModel), .locationInput(let rhsViewModel)),
             (.introduceInput(let lhsViewModel), .introduceInput(let rhsViewModel)),
             (.checkInputInfo(let lhsViewModel), .checkInputInfo(let rhsViewModel)):
            return lhsViewModel.id == rhsViewModel.id // ✅ ViewModel의 고유 id 비교
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .calendarSelect(let viewModel),
             .weekDaySelect(let viewModel),
             .timeSelect(let viewModel),
             .categorySelect(let viewModel),
             .coverImageSelect(let viewModel),
             .locationInput(let viewModel),
             .introduceInput(let viewModel),
             .checkInputInfo(let viewModel):
            hasher.combine(viewModel.id) // ✅ Hashable 비교 기준을 id로 설정
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case let .calendarSelect(viewModel):
            CalendarSelectView(viewModel: viewModel)
        case let .weekDaySelect(viewModel):
            WeekDaySelect(viewModel: viewModel)
        case let .timeSelect(viewModel):
            TimeSelect(viewModel: viewModel)
        case let .categorySelect(viewModel):
            CategorySelect(viewModel: viewModel)
        case let .coverImageSelect(viewModel):
            CoverImageSelect(viewModel: viewModel)
        case let .locationInput(viewModel):
            LocationInput(viewModel: viewModel)
        case let .introduceInput(viewModel):
            IntroduceInput(viewModel: viewModel)
        case let .checkInputInfo(viewModel):
            CheckInputInfo(viewModel: viewModel)
        }
    }
}

enum MyFillingDestination: Hashable {
    // TODO: 나의채움 모든 화면 작성
}

enum HomeDestination: Hashable {
    // TODO: 홈화면 모든 화면 작성
}
