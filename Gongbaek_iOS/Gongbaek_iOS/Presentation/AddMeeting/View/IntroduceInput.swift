//
//  IntroduceInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct IntroduceInput: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var viewModel = AddMeetingViewModel()

    @State var showError: Bool
    @State var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "소개글을 작성해주세요.", subtitle: nil)
                    .padding(.bottom, 28)
                
                CustomTextField(
                    text: $viewModel.title,
                    showError: $showError,
                    state: .title
                )
                .padding(.bottom, 28)
                .onChange(of: viewModel.title) { _ in
                    viewModel.updateNextButtonState()
                }
                
                CustomTextEditor(text: $viewModel.introduction)
                    .onChange(of: viewModel.introduction) { _ in
                        viewModel.updateNextButtonState()
                    }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                navigationManager.push(view: FillingDestination.checkInputInfo)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}
