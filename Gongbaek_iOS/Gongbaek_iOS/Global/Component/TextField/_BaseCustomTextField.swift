//
//  _BaseCustomTextField.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/10/25.
//

import SwiftUI

/// CustomTextField, CustomTextFieldWithStatus 컴포넌트에서 사용하는 내부 공통 뷰
struct _BaseCustomTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var type: TextFieldType
    
    var body: some View {
        Text(type.titleText)
            .font(.pretendard(.body2_sb_14))
            .foregroundColor(.gray08)
            .padding(.bottom, 6)
        
        TextField(
            type.placeholderText,
            text: $text
        )
        .focused($isFocused)
        .font(.pretendard(.body1_m_16))
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(.gray01)
        .cornerRadius(6)
        .accentColor(.gray05)
        .onChange(of: text) { [text] in
            if text.count > type.maxCharacterCount {
                self.text = String(text.prefix(type.maxCharacterCount))
            }
        }
    }
}
