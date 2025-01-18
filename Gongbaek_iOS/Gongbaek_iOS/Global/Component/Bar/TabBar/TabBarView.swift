//
//  TabBarView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var navigationManager = NavigationManager()
    @State var selectedTab: TabBarState = .home
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack(spacing: 0) {
                selectedTab.view()
                    .frame(maxHeight: .infinity)
                CustomTabBar(selectedTab: $selectedTab)
            }
            .navigationDestination(for: OnboardingDestination.self) { type in
                OnboardingDestinationView(type: type)
            }
            .navigationDestination(for: HomeDestination.self) { type in
                HomeDestinationView(type: type)
            }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    TabBarView()
}
