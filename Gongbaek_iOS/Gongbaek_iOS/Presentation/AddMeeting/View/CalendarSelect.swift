//
//  CalendarSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CalendarSelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 68)
            
            CustomCalendar(selectedDate: $viewModel.selectedWeekDate)
                .onChange(of: viewModel.selectedWeekDate) { newValue in
                    print("선택된 날짜: \(newValue)")
                    viewModel.isNextEnabled = true
                }
            
        }
        .padding(.horizontal, 16)
    }
    
}

#Preview {
    let viewModel = AddMeetingViewModel()
    CalendarSelect(viewModel: viewModel)
}
