//
//  TitleTextBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/16/25.
//

import SwiftUI

struct TitleTextBox: View {
    let title: String
    let subtitle: String
    var highlightTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .pretendardFont(.head2_b_24)
//            HighlightTextView(
//                text: subtitle,
//                textColor: .gray07,
//                font: .body1_b_16,
//                highlightText: highlightTitle
//            )
        }
    }
}

#Preview {
    TitleTextBox(
        title: "공강시간에 원하는 모임 만들기",
        subtitle: "공강이라는 공백, 어떻게 채우고 있나요? 이제 원하는 모임으로 특별하게 채워보세요.",
        highlightTitle: "공강이라는 공백,"
    )
}
