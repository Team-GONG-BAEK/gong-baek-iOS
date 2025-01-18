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
            .navigationDestination(for: FillingDestination.self) { type in
//                type.view()
//                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: MyFillingDestination.self) { type in
//                type.view()
//                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationDestination(for: HomeDestination.self) { type in
//                type.view()
//                    .toolbar(.hidden, for: .navigationBar)
            }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    TabBarView()
}
