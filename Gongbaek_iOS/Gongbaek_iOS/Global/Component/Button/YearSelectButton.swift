//
//  YearSelectButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/17/25.
//

import SwiftUI

struct YearSelectButton: View {
    var isTapped: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("입학년도")
                .pretendardFont(.body2_sb_14)
                .foregroundColor(.gray08)
            Button(action: {}) {
                HStack {
                    Text("\(Date.currentYear())년")
                        .pretendardFont(.body1_m_16)
                        .foregroundColor(isTapped ? .gray10 : .gray04)
                    Spacer()
                    Image(.icArrowBottomGray24)
                        .foregroundColor(.gray04)
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .background(.grayWhite)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray03, lineWidth: 1)
            )
        }
    }
}

#Preview {
    YearSelectButton(isTapped: true)
        .padding(16)
}
