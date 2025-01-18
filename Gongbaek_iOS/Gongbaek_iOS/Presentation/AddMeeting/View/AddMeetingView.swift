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
                CycleSelect()
            case 1:
                CalendarSelect()
            case 2:
                CycleSelect()
            case 3:
                CycleSelect()
            case 4:
                CycleSelect()
            case 5:
                CycleSelect()
            case 6:
                CycleSelect()
            default:
                CycleSelect()
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
