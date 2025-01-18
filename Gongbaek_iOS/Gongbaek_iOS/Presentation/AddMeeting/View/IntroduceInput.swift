//
//  IntroduceInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct IntroduceInput: View {
    @State private var location: String = ""
    @State var showError: Bool
    @State var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "소개글을 작성해주세요.", subtitle: nil)
                .padding(.bottom, 28)
            
            CustomTextField(
                text: $location,
                showError: $showError,
                state: .title
            )
            
            CustomTextEditor()
        }
        .padding(.horizontal)
    }
}

#Preview {
    IntroduceInput(showError: false, isFocused: false)
}
