//
//  LocationInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct LocationInput: View {
    @State private var location: String = ""
    @State var showError: Bool
    @State var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 20)
            
            CustomTextField(
                text: $location,
                showError: $showError,
                state: .location
            )
            
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: "본인 포함 최소 2명부터 최대 10명까지 모집 가능해요.")
                .padding(.bottom, 20)
            
            HStack(spacing: 10) {
                CounterButton(state: .decrease)
                PersonCountBox()
                CounterButton(state: .increase)
            }
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    LocationInput(showError: false, isFocused: false)
}
