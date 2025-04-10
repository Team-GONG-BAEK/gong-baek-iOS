//
//  IntroduceInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

import Combine

struct IntroduceInput: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel
        
    @State var showError: Bool = false
    @State var isFocused: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "소개글을 작성해주세요.", subtitle: nil)
                .padding(.bottom, 28)
            
            CustomTextField(
                text: $viewModel.title,
                showError: $showError,
                type: .title
            )
            .padding(.bottom, 28)
            
            CustomTextEditor(text: $viewModel.introduction)
                .padding(.bottom, 40)
        }
        .padding(.horizontal, 16)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

