//
//  SmallButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct SmallButton: View {
    var text: String
    var isTapped: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            Text(text)
                .font(isTapped ? .pretendard(.body1_b_16) : .pretendard(.body1_m_16))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(isTapped ? .subOrange : .gray01)
                .foregroundColor(isTapped ? .mainOrange : .gray07)
        }
        .buttonStyle(PlainButtonStyle())
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .clipped()
    }
}

#Preview {
    SmallButton(text: "Button", isTapped: true)
    SmallButton(text: "Button", isTapped: false)
}
