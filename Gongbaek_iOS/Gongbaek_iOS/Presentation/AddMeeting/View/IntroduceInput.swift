//
//  IntroduceInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct IntroduceInput: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel
    
    @State private var isNextEnabled: Bool = false
    
    @State var showError: Bool
    @State var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ProgressBar(currentIndex: 6)
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
                
                CustomTextEditor(text: $viewModel.introduction)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: isNextEnabled) {
                navigationManager.push(view: FillingDestination.checkInputInfo)
            }
            .disabled(!isNextEnabled)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .onChange(of: viewModel.title) { _ in
            updateNextButtonState()
        }
        .onChange(of: viewModel.introduction) { _ in
            updateNextButtonState()
        }
        .customNavigationBar(showBackButton: true)
    }
}

extension IntroduceInput {
    private func updateNextButtonState() {
        let isTitleValid = viewModel.title.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2
        let isIntroductionValid = viewModel.introduction.trimmingCharacters(in: .whitespacesAndNewlines).count >= 20
        
        isNextEnabled = isTitleValid && isIntroductionValid 
    }
}
