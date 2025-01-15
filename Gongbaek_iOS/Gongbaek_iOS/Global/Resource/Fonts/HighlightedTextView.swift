//
//  HighlightedTextView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/16/25.
//

import SwiftUI

struct HighlightTextView: View {
    let text: String
    let textColor: Color
    let font: FontFamily
    let highlightText: String
    var highlightColor: Color = .mainOrange

    var body: some View {
        HStack(spacing: 0) {
            let parts = text.components(separatedBy: highlightText)
            ForEach(parts.indices, id: \.self) { index in
                if index > 0 {
                    Text(highlightText)
                        .foregroundColor(highlightColor)
                        .pretendardFont(font)
                }
                Text(parts[index])
                    .foregroundColor(textColor)
                    .pretendardFont(font)
            }
        }
    }
}

#Preview {
    HighlightTextView(
        text: "일반텍스트 사이에 있는 강조텍스트를 사용합니다",
        textColor: .black,
        font: .body1_b_16,
        highlightText: "텍스트 "
    )
}
