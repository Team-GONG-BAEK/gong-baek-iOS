//
//  AppleLoginButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/31/25.
//

import SwiftUI

struct AppleLoginButton: View {
    var onTap: (() -> Void)?

    var body: some View {
        Button(action: {
            onTap?()
        }) {
            HStack(alignment: .center, spacing: 8) {
                Image(.imgAppleLogo)
                    .resizable()
                    .frame(width: 14, height: 16)
                Text("Apple로 로그인")
                    .foregroundColor(.grayBlack)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 21)
        }
        .background(.grayWhite)
        .cornerRadius(6)
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
    }
}

#Preview {
    AppleLoginButton()
}
