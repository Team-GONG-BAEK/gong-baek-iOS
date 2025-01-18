//
//  CalendarSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CalendarSelectView: View {
    @StateObject var viewModel: AddMeetingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                    .padding(.bottom, 68)
                
                CustomCalendar(selectedDate: $viewModel.selectedWeekDate)
                    .onChange(of: viewModel.selectedWeekDate) { _ in
                        print("📅 선택된 날짜: \(viewModel.formattedDate ?? "N/A")")
                        print("🗓 선택된 요일: \(viewModel.selectedWeekDay?.rawValue ?? "N/A")")
                        viewModel.isNextEnabled = true
                    }
            }
            .padding(.horizontal, 16)
            
            
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
    let viewModel = AddMeetingViewModel()
    CalendarSelectView(viewModel: viewModel)
}
