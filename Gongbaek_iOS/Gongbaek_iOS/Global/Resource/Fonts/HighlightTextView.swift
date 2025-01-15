//
//  HighlightTextView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/16/25.
//

import SwiftUI

struct HighlightTextView: View {
    let text: String
    let textColor: Color
    let font: FontFamily
    var highlightString: String = ""
    var highlightColor: Color = .mainOrange
    
    var body: some View {
        highlightText
            .pretendardFont(font)
    }
    
    private var highlightText: Text {
        guard !highlightString.isEmpty,
              let targetIndex = text.range(of: highlightString) else {
            return Text(text)
                .foregroundColor(textColor)
        }
        
        let leadingString = text[text.startIndex..<targetIndex.lowerBound]
        let targetString = text[targetIndex.lowerBound..<targetIndex.upperBound]
        let trailingString = text[targetIndex.upperBound..<text.endIndex]
        
        let unmatchText = Text(leadingString)
            .foregroundColor(textColor)
        let targetText = Text(targetString)
            .foregroundColor(highlightColor)
        let trailingText = Text(trailingString)
            .foregroundColor(textColor)
        
        let result = unmatchText + targetText + trailingText
        return result
    }
}

#Preview {
    HighlightTextView(
        text: "일반텍스트 사이에 있는 강조텍스트를 사용합지마",
        textColor: .gray07,
        font: .body1_m_16,
        highlightString: "강조텍스트"
    )
}
