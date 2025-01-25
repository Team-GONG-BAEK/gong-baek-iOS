//
//  OnboardingNavigation.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import SwiftUI

struct OnboardingNavigation: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @Binding var currentPage: Int
    let pageCount: Int
    
    var body: some View {
        HStack {
            if currentPage > 0 {
                Button(action: {
                    withAnimation { currentPage -= 1 }
                }) {
                    Image(.icArrowLeft48)
                        .foregroundColor(.gray04)
                        .frame(width: 48, height: 48)
                }
            } else {
                Spacer().frame(width: 48, height: 48)
            }
            Spacer()
            
            /// (자동로그인 구현 전) 회원가입 건너뛰기 비밀 버튼
            Button {
                withAnimation {
                    navigationManager.rootView = .tabBar
                }
            } label: {
                Rectangle()
                    .fill(.white)
                    .frame(width: 48, height: 48)
            }
        }
        .padding(.bottom, 54)
    }
}
