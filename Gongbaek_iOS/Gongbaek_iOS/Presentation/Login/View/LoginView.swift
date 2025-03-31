//
//  LoginView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/25/25.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.gray10).ignoresSafeArea()
            
            VStack {
                Image(.imgLogo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 248)
                
                MultiColoredText(
                    originalText: "공강을 백으로 채우다",
                    coloredSubstrings: [("공", .mainOrange), ("백", .mainOrange)]
                )
                .foregroundColor(.grayWhite)
                .font(.pretendard(.body2_sb_14))
                .padding(.top, 28)
                
                Spacer()

                AppleLoginButton(onTap:viewModel.handleAppleSignIn)
            }
        }
        .onChange(of: viewModel.isSignedIn) {
            if viewModel.isSignedIn {
                navigationManager.push(view: LoginDestination.agree)
            }
        }
    }
}

#Preview {
    LoginView()
}
