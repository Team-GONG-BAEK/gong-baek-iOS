//
//  CalendarSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CalendarSelectView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel
    
    @State private var isNextEnabled: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: 1)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                    .padding(.bottom, 68)
                
                CustomCalendar(selectedDate: $viewModel.selectedWeekDate)
                    .onChange(of: viewModel.selectedWeekDate) { _ in
                        isNextEnabled = true
                    }
            }
            .padding(.horizontal, 16)
            
            
            Spacer()
            BasicButton(text: "다음", isActivated: isNextEnabled) {
                navigationManager.push(view: FillingDestination.timeSelect)
            }
            .disabled(!isNextEnabled)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}


