//
//  NavigationDestination.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

enum SignupDestination: Hashable {
    case signup
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .signup:
            SignupView()
        }
    }
}

enum FillingDestination: Hashable, CaseIterable {
    case addMeeting
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .addMeeting:
            AddMeetingView(viewModel: AddMeetingViewModel())
        }
    }
}

enum MyFillingDestination: Hashable {
    // TODO: 나의채움 모든 화면 작성
}

enum HomeDestination: Hashable {
    // TODO: 홈화면 모든 화면 작성
}

/// Present 방식으로 화면 전환되는 Destination 정의
enum PresentableDestination: Identifiable {
    case schoolMajorSearchView(SignupViewModel, SearchViewState)

    var id: String {
        switch self {
        case let .schoolMajorSearchView(_, state):
            return state.rawValue
        }
    }

    @ViewBuilder
    func view() -> some View {
        switch self {
        case let .schoolMajorSearchView(viewModel, state):
            SchoolMajorSearchView(viewModel: viewModel, state: state)
        }
    }
}
