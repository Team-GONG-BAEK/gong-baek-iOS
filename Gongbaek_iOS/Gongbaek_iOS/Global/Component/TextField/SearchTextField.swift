//
//  CustomTextField.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct SearchTextField: View {
    @State var inputText: String
    @FocusState private var isFocused: Bool 
    var state: SearchTextFieldState
    var buttonAction: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(state.rawValue)
                .font(.pretendard(.body2_sb_14))
                .foregroundColor(.gray08)
            
            ZStack {
                TextField(
                    "\(state.rawValue)을 검색하세요.",
                    text: $inputText
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
                
                HStack {
                    Spacer()
                    Button(action: {
                        buttonAction(inputText)
                    }) {
                        Image(.icSearchGray48)
                            .foregroundColor(isFocused ? .gray10 : .gray04)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SearchTextField(inputText: "", state: .school) { text in
            print("Search button clicked for School with input: \(text)")
        }
        
        SearchTextField(inputText: "", state: .major) { text in
            print("Search button clicked for Major with input: \(text)")
        }
    }
    .padding()
}
