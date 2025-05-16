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
            TitleTextBox(title: "공백을 채울 날짜를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 68)
            
            CustomCalendar(selectedDate: $viewModel.selectedWeekDate)
        }
        .padding(.horizontal, 16)
    }
}


