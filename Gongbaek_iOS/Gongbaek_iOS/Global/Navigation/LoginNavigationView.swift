//
//  LoginNavigationView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/27/25.
//

import SwiftUI

struct LoginNavigationView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack(spacing: 0) {
                LoginDestination.login.view()
                    .fullScreenCover(item: $navigationManager.presentedDestination) { type in
                        type.view()
                    }
            }
            .navigationDestination(for: LoginDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    LoginNavigationView()
}
