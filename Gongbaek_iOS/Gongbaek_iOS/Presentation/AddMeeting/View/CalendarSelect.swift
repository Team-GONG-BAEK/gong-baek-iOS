//
//  CalendarSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CalendarSelect: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "활동주기를 선택해주세요.", subtitle: nil)
                .padding(.bottom, 68)
            
            CustomCalendar()
        }
        .padding(.horizontal, 16)
       
    }
}

#Preview {
    CalendarSelect()
}
