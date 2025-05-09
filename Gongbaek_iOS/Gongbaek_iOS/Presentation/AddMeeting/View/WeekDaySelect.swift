//
//  WeekDaySelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct WeekDaySelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
        
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "공백을 채울 요일을 선택해주세요.", subtitle: nil)
                .padding(.bottom, 60)
            
            VStack(spacing: 16) {
                ForEach(WeekDay.allCases, id: \.self) { day in
                    SmallButton(
                        text: day.koreanName,
                        isTapped: viewModel.selectedWeekDay == day
                    ){
                        viewModel.selectedWeekDay = day
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
