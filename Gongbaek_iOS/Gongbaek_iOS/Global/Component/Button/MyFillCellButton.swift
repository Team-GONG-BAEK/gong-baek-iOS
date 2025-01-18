//
//  MyFillCellButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MyFillCellButton: View {
    var text: String
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            print("\(text) 눌렸음!")
            onTap?()
        }) {
            Text(text)
                .font(.pretendard(.body2_sb_14))
                .frame(height: 38)
                .frame(maxWidth: .infinity)
                .background(.gray01)
                .foregroundColor(text == "작성글 보기" ? .gray08 : .mainOrange)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MyFillCellButton(text: "작성글 보기")
}
