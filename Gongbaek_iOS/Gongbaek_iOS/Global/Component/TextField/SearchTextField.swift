//
//  CustomTextField.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct SearchTextField: View {
    @State var inputText: String
    var buttonAction: (String) -> Void // 입력된 텍스트를 전달받는 클로저

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("학교명")
                .font(.pretendard(.body2_sb_14))
                .foregroundColor(.gray08)
            
            ZStack {
                TextField(
                    "한글을 활용해 최대 8자 이내로 입력해주세요.",
                    text: $inputText
                )
                .font(.pretendard(.body1_m_16))
                .padding(.vertical, 14)
                .padding(.leading, 16)
                .padding(.trailing, 48)
                .background(Color.gray01)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                HStack {
                    Spacer()
                    Button(action: {
                        buttonAction(inputText) // 입력된 텍스트를 클로저로 전달
                    }) {
                        Image(.icSearch)
                            .foregroundColor(.gray04)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SearchTextField(inputText: "") { text in
            print("Button clicked with text: \(text)") // 입력된 텍스트 출력
        }
    }
}
