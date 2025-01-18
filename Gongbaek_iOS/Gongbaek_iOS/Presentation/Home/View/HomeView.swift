//
//  HomeView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        Text("홈")
        
        Button("프로필 이동") {
            navigationManager.push(view: OnboardingDestination.profileSelection)
        }
        Button("다른 이동") {
            navigationManager.push(view: HomeDestination.schoolMajorInput)
        }
    }
}

#Preview {
    HomeView()
}
