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
