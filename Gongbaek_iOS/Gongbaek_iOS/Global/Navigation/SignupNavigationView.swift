//
//  SignupNavigationView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SignupNavigationView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            SignupDestination.signup.view()
            .fullScreenCover(item: $navigationManager.presentedDestination) { type in
                type.view()
            }
        }
    }
}

#Preview {
    SignupNavigationView()
}
