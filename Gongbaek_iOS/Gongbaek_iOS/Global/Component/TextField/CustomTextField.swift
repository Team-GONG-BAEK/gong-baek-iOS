//
//  NicknameTextField.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct CustomTextField: View {
    @State var text = ""
    @FocusState private var isFocused: Bool
    var state: TextFieldState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(state.titleText)
                .font(.pretendard(.body2_sb_14))
                .foregroundColor(.gray08)
            
            TextField(
                state.placeholderText,
                text: $text
            )
            .focused($isFocused)
            .font(.pretendard(.body1_m_16))
            .padding(.vertical, 14)
            .padding(.leading, 16)
            .padding(.trailing, 48)
            .background(.gray01)
            .accentColor(.gray05)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isFocused ? .gray10 : .clear, lineWidth: 1)
            )
            .onChange(of: text) { [text] in
                if text.count > state.maxCharacterCount {
                    self.text = String(text.prefix(state.maxCharacterCount))
                }
            }
            
            
            HStack {
                Spacer()
                Text("\(text.count)/\(state.maxCharacterCount)")
                    .font(.pretendard(.caption2_r_12))
                    .foregroundColor(.gray06)
            }
        }
    }
}


#Preview {
    CustomTextField(text: "", state: .nickname)
}
