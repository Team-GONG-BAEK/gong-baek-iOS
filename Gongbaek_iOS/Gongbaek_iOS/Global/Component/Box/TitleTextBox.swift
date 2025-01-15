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
        VStack(alignment: .leading) {
            Text(title)
                .pretendardFont(.head2_b_24)
            HighlightTextView(
                text: subtitle,
                textColor: .black,
                font: .body1_b_16,
                highlightText: highlightTitle
            )
        }
    }
}

#Preview {
    TitleTextBox(
        title: "타이틀",
        subtitle: "서브타이틀",
        highlightTitle: "서브"
    )
}
