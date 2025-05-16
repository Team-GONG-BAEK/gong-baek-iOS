//
//  TextField+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

extension TextField {
    func pretendardFont(_ font: FontFamily) -> some View {
        let uiFont = UIFont.pretendard(font)
        let lineSpacingValue = font.lineHeight - uiFont.lineHeight
            
        return self.font(Font(uiFont))
            .tracking(font.letterSpacing)
            .lineSpacing(lineSpacingValue)
            .padding(.vertical, lineSpacingValue/2)
    }
}
