//
//  LocationInput.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct LocationInput: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel
    
    @State private var location: String = ""
    @State var showError: Bool
    @State var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                    .padding(.bottom, 20)
                
                CustomTextField(
                    text: $viewModel.location,
                    showError: $showError,
                    state: .location
                )
                .padding(.bottom, 40)
                .onChange(of: viewModel.location) { newValue in
                    viewModel.updateNextButtonState()
                }
                
                TitleTextBox(title: "인원을 선택해주세요.", subtitle: "본인 포함 최소 2명부터 최대 10명까지 모집 가능해요.", highlightSubtitleText: "최소 2명부터 최대 10명")
                    .padding(.bottom, 20)
                
                HStack(spacing: 10) {
                    CounterButton(state: .decrease, onTap: {
                        viewModel.decreasePeopleCount()
                    })
                    PersonCountBox(num: viewModel.maxPeopleCount)
                    CounterButton(state: .increase, onTap: {
                        viewModel.increasePeopleCount()
                    })
                }
                
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                viewModel.goToNextPage()
                navigationManager.push(view: FillingDestination.introduceInput)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}

