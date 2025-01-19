//
//  SignupView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            SignupDestination.profileSelection.view()
            .navigationDestination(for: SignupDestination.self) { type in
                type.view()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
        .environmentObject(navigationManager)
    }
}

#Preview {
    SignupView()
}
