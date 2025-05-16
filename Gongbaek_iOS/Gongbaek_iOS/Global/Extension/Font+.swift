//
//  Font+.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/9/25.
//

import SwiftUI

extension Font {
    static func pretendard(_ font: FontFamily) -> Font {
        .custom(font.fontName.rawValue, size: font.fontSize)
    }
}

extension UIFont {
    static func pretendard(_ font: FontFamily) -> UIFont {
        return UIFont(name: font.fontName.rawValue, size: font.fontSize)!
    }
}
