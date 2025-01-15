//
//  LocationBox.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct LocationBox: View {
    let state: InfoColorState
    let text: String
    let font: Font
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(.icPlace16)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(iconColor)
            
            Text(text)
                .font(font)
                .foregroundColor(textColor)
        }
    }
    
    private var iconColor: Color {
        switch state {
        case .gray:
            return .gray05
        case .white:
            return .grayWhite
        }
    }
    
    private var textColor: Color {
        switch state {
        case .gray:
            return .gray06
        case .white:
            return .grayWhite
        }
    }
    
}


#Preview {
    LocationBox(state: .gray, text: "우리집!", font: .pretendard(.caption2_r_12))
}
