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

    var body: some Scene {
        WindowGroup {
            RootViewSwitcher()
                .environmentObject(navigationManager)
        }
    }
}
