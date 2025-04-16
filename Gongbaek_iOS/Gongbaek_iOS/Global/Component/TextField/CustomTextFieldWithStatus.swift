//
//  CustomTextFieldWithStatus.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/7/25.
//

import SwiftUI

/// 에러/상태 메시지 있는 커스텀 텍스트필드
struct CustomTextFieldWithStatus<Status: TextFieldErrorStatus>: View {
    @Binding var text: String
    @Binding var status: Status?
    @FocusState var isFocused: Bool
    var type: TextFieldType
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading, spacing: 0) {
                Text(type.titleText)
                    .font(.pretendard(.body2_sb_14))
                    .foregroundColor(.gray08)
                    .padding(.bottom, 10)
                
                _BaseCustomTextField(
                    text: $text,
                    isFocused: $isFocused,
                    type: type
                )
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(strokeColor(), lineWidth: 1)
                )
                .onChange(of: text) {
                    if status as? TextFieldType.VerificationStatus != .expiredCode,
                       status != nil {
                        self.status = nil
                    }
                }
                
                if type == .nickname,
                   let maxCharacterCount = type.maxCharacterCount {
                    HStack {
                        Spacer()
                        
                        Text("\(text.count)/\(maxCharacterCount)")
                            .font(.pretendard(.caption2_r_12))
                            .frame(height: 18)
                            .foregroundColor(.gray06)
                            .padding(.top, 4)
                    }
                }
            }
            
            HStack {
                if let status = status {
                    Text(status.message)
                        .font(.pretendard(.caption2_r_12))
                        .foregroundColor(status.isError ? .errorRed : .gray06)
                        .frame(height: 18)
                        .offset(y: type == .nickname ? 0 : 18+2)
                }
                
                Spacer()
            }
        }
    }
    
    private func strokeColor() -> Color {
        if let isError = status?.isError,
           isError {
            return .errorRed
        } else {
            return isFocused ? .gray10 : .clear
        }
    }
}

struct NicknameTestView: View {
    @State private var nickname: String = ""
    @State private var status: TextFieldType.NicknameStatus? = nil

    private let duplicatedNames = ["나연맘", "민서웅니", "희은아가"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            CustomTextFieldWithStatus<TextFieldType.NicknameStatus>(
                text: $nickname,
                status: $status,
                type: .nickname
            )

            Button(action: {
                checkDuplicateNickname()
            }) {
                Text("중복 확인")
                    .font(.pretendard(.title2_sb_18))
                    .foregroundColor(.grayWhite)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.mainOrange)
                    .cornerRadius(8)
            }
            .disabled(nickname.isEmpty)
        }
        .padding()
    }

    private func checkDuplicateNickname() {
        status = duplicatedNames.contains(nickname)
        ? TextFieldType.NicknameStatus.duplicatedNickname
        : nil
    }
}

#Preview {
    NicknameTestView()
}
