//
//  CustomTextEditor.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    @FocusState var isEditing: Bool
    private let isSignupView: Bool
    private let maxCharacterCount = 100
    
    init(text: Binding<String>, isSignupView: Bool = false) {
        self._text = text
        self.isSignupView = isSignupView
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("소개글")
                .pretendardFont(.body2_sb_14)
                .foregroundColor(.gray08)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(
                        isSignupView
                        ? "간단한 소개글을 작성해보세요.\nex) 안녕하세요! 이번에 복학한 학생입니다. 함께 좋은 모임 만들어봐요~!"
                        : "간단한 소개글을 작성해보세요.\nex) 화석된 사람들끼리 소소한 점심 모임 어때요?"
                    )
                    .pretendardFont(.body1_m_16)
                    .foregroundColor(.gray04)
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                }

                TextEditor(text: $text)
                    .pretendardFont(.body1_m_16)
                    .padding(EdgeInsets(top: 6, leading: 11, bottom: 6, trailing: 11))
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .onChange(of: text) { [text] in
                        if text.count > maxCharacterCount {
                            self.text = String(text.prefix(maxCharacterCount))
                        }
                    }
                    .focused($isEditing)
            }
            .background(.gray01)
            .accentColor(.gray05)
            .frame(height: 143)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isEditing ? .gray10 : Color.clear, lineWidth: 1)
            )

            HStack {
                Spacer()
                Text("\(text.count)/\(maxCharacterCount)")
                    .pretendardFont(.caption2_r_12)
                    .foregroundColor(.gray06)
            }
        }
    }
}

#Preview {
    CustomTextEditor(text: .constant(""))
        .padding(16)
}
