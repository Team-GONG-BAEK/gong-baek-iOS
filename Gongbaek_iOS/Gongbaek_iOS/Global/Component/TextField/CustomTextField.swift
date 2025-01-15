//
//  NicknameTextField.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @Binding var showError: Bool // 외부에서 에러 상태를 관리
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
            .padding(.horizontal, 16)
            .background(.gray01)
            .cornerRadius(6)
            .accentColor(.gray05)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(showError ? .errorRed : (isFocused ? .gray10 : .clear), lineWidth: 1)
            )
            .onChange(of: text) { [text] in
                if text.count > state.maxCharacterCount {
                    self.text = String(text.prefix(state.maxCharacterCount))
                }
            }
            
            HStack {
                if showError {
                    Text("중복된 닉네임입니다. 다시 입력해주세요.")
                        .font(.pretendard(.caption2_r_12))
                        .foregroundColor(.errorRed)
                }
                Spacer()
                Text("\(text.count)/\(state.maxCharacterCount)")
                                    .font(.pretendard(.caption2_r_12))
                                    .foregroundColor(.gray06)
            }
            
        }
    }
}

#Preview {
    @Previewable @State var nickname: String = ""
    @Previewable @State var showError: Bool = true
    
    VStack(spacing: 20) {
        CustomTextField(
            text: $nickname,
            showError: $showError,
            state: .nickname
        )
    }
    .padding()
}
