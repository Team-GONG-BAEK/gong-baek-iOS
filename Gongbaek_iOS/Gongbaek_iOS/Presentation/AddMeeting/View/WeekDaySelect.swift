//
//  WeekDaySelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct WeekDaySelect: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: AddMeetingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                    .padding(.bottom, 60)
                
                VStack(spacing: 16) {
                    ForEach(WeekDay.allCases, id: \.self) { day in
                        SmallButton(
                            text: day.koreanName,
                            isTapped: viewModel.selectedWeekDay == day
                        ){
                            viewModel.selectedWeekDay = day
                            viewModel.isNextEnabled = true
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                viewModel.goToNextPage()
                navigationManager.push(view: FillingDestination.timeSelect)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}
