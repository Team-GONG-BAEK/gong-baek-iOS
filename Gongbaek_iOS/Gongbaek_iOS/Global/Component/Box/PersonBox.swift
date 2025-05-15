//
//  PersonBox.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct PersonBox: View {
    let state: InfoColorState
    let text: String
    let font: FontFamily
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(.icPeople18)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.gray05)

            Text(text)
                .pretendardFont(font)
                .foregroundColor(textColor)
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
    PersonBox(state: .gray, text: "우리집!", font: .caption2_r_12)
}
