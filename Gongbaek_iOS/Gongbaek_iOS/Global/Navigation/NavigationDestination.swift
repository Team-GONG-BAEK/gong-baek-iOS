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
            NicknameInputView()
        case .schoolMajorInput:
            SchoolMajorInputView()
        }
    }
}

enum FillingDestination: Hashable {
    // TODO: 채우기 모든 화면 작성
}

enum MyFillingDestination: Hashable {
    // TODO: 나의채움 모든 화면 작성
}

enum HomeDestination: Hashable {
    // TODO: 홈화면 모든 화면 작성
}

/// Present 방식으로 화면 전환되는 Destination 정의
enum PresentableDestination: Identifiable {
    case schoolMajorSearchView(SearchViewState)

    var id: String {
        switch self {
        case let .schoolMajorSearchView(state):
            return state.rawValue
        }
    }

    @ViewBuilder
    func view() -> some View {
        switch self {
        case let .schoolMajorSearchView(state):
            SchoolMajorSearchView(state: state)
        }
    }
}
