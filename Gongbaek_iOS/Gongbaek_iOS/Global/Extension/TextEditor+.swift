//
//  TextEditor+.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 5/16/25.
//

import SwiftUI

extension TextEditor {
    func pretendardFont(_ font: FontFamily) -> some View {
        let uiFont = UIFont.pretendard(font)
        let lineSpacingValue = font.lineHeight - uiFont.lineHeight
        
        return self.font(Font(uiFont))
            .tracking(font.letterSpacing)
            .lineSpacing(lineSpacingValue)
            .padding(.vertical, lineSpacingValue/2)
    }
}
