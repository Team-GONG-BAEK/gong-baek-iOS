//
//  AddMeetingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingView: View {
    @StateObject private var viewModel = AddMeetingViewModel()
    
    var body: some View {
        VStack {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            switch viewModel.currentIndex {
            case 0:
                CycleSelect(
                    currentIndex: $viewModel.currentIndex,
                    isNextEnabled: $viewModel.isNextEnabled,
                    selectedCycle: $viewModel.selectedCycle
                )
            case 1:
                if viewModel.selectedCycle == .once {
                    CalendarSelect()
                } else if viewModel.selectedCycle == .weekly {
                    WeekDaySelect()
                }
            case 2:
                DateSelect()
            case 3:
                CalendarSelect()
            case 4:
                CalendarSelect()
            case 5:
                CalendarSelect()
            case 6:
                CalendarSelect()
            default:
                CalendarSelect()
            }
            
            Spacer()
            
            BasicButton(text: "다음") {
                viewModel.goToNextPage()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AddMeetingView()
}
