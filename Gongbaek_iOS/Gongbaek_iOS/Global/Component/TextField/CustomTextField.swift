//
//  NicknameTextField.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

/// 에러/상태 메시지 없는 기본 커스텀 텍스트필드
struct CustomTextField: View {
    @Binding var text: String
    @Binding var showError: Bool
    @FocusState private var isFocused: Bool
    var type: TextFieldType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            _BaseCustomTextField(
                text: $text,
                type: type
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(strokeColor(), lineWidth: 1)
            )
            
            HStack {
                Spacer()
                
                Text("\(text.count)/\(type.maxCharacterCount)")
                    .font(.pretendard(.caption2_r_12))
                    .foregroundColor(.gray06)
            }
        }
    }
    
    private func strokeColor() -> Color {
        if showError {
            return .errorRed
        } else {
            return isFocused ? .gray10 : .clear
        }
    }
}
