//
//  AddMeetingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingView: View {
    @StateObject var viewModel = AddMeetingViewModel()
    
    
    var body: some View {
        VStack {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            switch viewModel.currentIndex {
            case 0:
                CycleSelect(viewModel: viewModel)
            case 1:
                if viewModel.selectedCycle == .once {
                    CalendarSelect()
                } else if viewModel.selectedCycle == .weekly {
                    WeekDaySelect()
                }
            case 2:
                DateSelect()
            case 3:
                CategorySelect(viewModel: viewModel)
            case 4:
                CoverImageSelect(viewModel: viewModel)
            case 5:
                LocationInput(showError: false, isFocused: false)
            case 6:
                IntroduceInput(showError: false, isFocused: false)
            default:
                CheckInputInfo()
            }
            
            Spacer()
            
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                viewModel.goToNextPage()
            }
            
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = AddMeetingViewModel()

    CoverImageSelect(viewModel: viewModel)
}
