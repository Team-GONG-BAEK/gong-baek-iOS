//
//  NavigationDestination.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

enum OnboardingDestination: Hashable {
    case profileSelection
    case nicknameInput
    case schoolMajorInput
}

struct OnboardingDestinationView: View {
    let type: OnboardingDestination
    
    var body: some View {
        switch type {
        case .profileSelection:
            ContentView()
        case .nicknameInput:
            Text("nicknameInput")
        case .schoolMajorInput:
            Text("schoolMajorInput")
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
    case schoolMajorInput
}

struct HomeDestinationView: View {
    let type: HomeDestination
    
    var body: some View {
        switch type {
        case .schoolMajorInput:
            Text("schoolMajorInput")
        }
    }
}
