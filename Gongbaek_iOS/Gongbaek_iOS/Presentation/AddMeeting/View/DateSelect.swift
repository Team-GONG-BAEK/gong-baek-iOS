//
//  DateSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct DateSelect: View {
    @State private var freeTimeTable: [TimeTableModel] = dummyFreeTimeTable
    @State private var selectedTimeRange: (start: Double, end: Double) = (0, 0)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 20)
            
            HStack(spacing: 12) {
                SelectedTimeBox(time: "00:00")
                Rectangle()
                    .fill(.gray04)
                    .frame(width: 16, height: 2)
                SelectedTimeBox(time: "00:00")
            }
            .padding(.bottom, 30)
            
            Text("나의 시간표")
                .font(.pretendard(.body1_b_16))
                .foregroundColor(.gray08)
                .padding(.bottom, 10)
            ScrollView {
                AddMeetingTimeTable(
                    freeTimeTable: $freeTimeTable,
                    selectedDay: .MON,
                    selectedTimeRange: $selectedTimeRange
                )
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    DateSelect()
}
