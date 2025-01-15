//
//  HighlightedTextView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/16/25.
//

import SwiftUI

struct HighlightedTextView: View {
    let text: String
    let textColor: Color
    let font: FontFamily
    var highlightString: String = ""
    var highlightColor: Color = .mainOrange
    
    var body: some View {
        highlightingText
            .pretendardFont(font)
    }
    
    private var highlightingText: Text {
        guard !highlightString.isEmpty,
              let matchIndex = text.range(of: highlightString) else {
            return Text(text)
                .foregroundColor(textColor)
        }
        
        let unmatchHeadString = text[text.startIndex..<matchIndex.lowerBound]
        let matchString = text[matchIndex.lowerBound..<matchIndex.upperBound]
        let unmatchTailString = text[matchIndex.upperBound..<text.endIndex]
        
        let unmatchText = Text(unmatchHeadString)
            .foregroundColor(textColor)
        
        let matchText = Text(matchString)
            .foregroundColor(highlightColor)
        
        let unmatchTailText = Text(unmatchTailString)
            .foregroundColor(textColor)
        
        let result = unmatchText + matchText + unmatchTailText
        return result
    }
}

#Preview {
    HighlightedTextView(
        text: "일반텍스트 사이에 있는 강조텍스트를 사용합지마",
        textColor: .gray07,
        font: .body1_m_16,
        highlightString: "강조텍스트"
    )
}
