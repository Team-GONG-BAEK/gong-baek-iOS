//
//  TimeBox.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum InfoColorState {
    case gray
    case white
}

struct TimeBox: View {
    let state: InfoColorState
    let text: String
    let font: Font
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(.icTime16)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.gray05)

            Text(text)
                .font(font)
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
    TimeBox(state: .gray, text: "몇시일까용?", font: .pretendard(.caption2_r_12))
}
