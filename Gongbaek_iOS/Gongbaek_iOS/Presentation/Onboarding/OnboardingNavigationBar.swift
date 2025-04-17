//
//  OnboardingNavigation.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import SwiftUI

struct OnboardingNavigationBar: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @Binding var currentPage: Int
    let pageCount: Int
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    currentPage > 0 ? (currentPage -= 1) : (navigationManager.pop())
                }
            }) {
                Image(.icArrowLeft48)
                    .foregroundColor(.gray04)
                    .frame(width: 48, height: 48)
            }
            
            Spacer()
        }
        .padding(.bottom, 54)
    }
}
