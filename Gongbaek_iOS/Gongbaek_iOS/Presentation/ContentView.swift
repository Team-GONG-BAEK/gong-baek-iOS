//
//  ContentView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("상세로 이동") {
                navigationManager.push(view: OnboardingDestination.nicknameInput)
            }
            Button("꺼져") {
                navigationManager.popToRoot()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
