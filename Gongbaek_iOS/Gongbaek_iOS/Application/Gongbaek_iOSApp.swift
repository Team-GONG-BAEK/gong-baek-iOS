//
//  Gongbaek_iOSApp.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/8/25.
//

import SwiftUI

@main
struct Gongbaek_iOSApp: App {
    @StateObject private var navigationManager = NavigationManager()
    @State private var showMainView = false

    var body: some Scene {
        WindowGroup {
            if showMainView {
                RootViewSwitcher()
                    .environmentObject(navigationManager)
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            if TokenManager.shared.hasAccessToken {
                                navigationManager.rootView = .tabBar
                            }
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}
