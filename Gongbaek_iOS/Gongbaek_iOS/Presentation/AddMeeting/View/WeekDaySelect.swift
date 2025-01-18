//
//  WeekDaySelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct WeekDaySelect: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
            
            VStack(spacing: 16) {
                ForEach(WeekFullDay.allCases, id: \.self) { day in
                    SmallButton(
                        text: day.displayName,
                        isTapped: false
                    )
                }
            }

        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    WeekDaySelect()
}
