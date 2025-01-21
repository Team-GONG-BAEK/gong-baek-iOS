//
//  MeetingChip.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/14/25.
//

import SwiftUI

struct MeetingChip: View {
    var state: MeetingChipState
    
    var body: some View {
        Text(state.titleText)
            .font(.pretendard(.caption2_r_12))
            .foregroundColor(state.textColor)
            .padding(.horizontal, 4)
            .padding(.vertical, 1)
            .background(state.backgroundColor)
            .cornerRadius(2)
    }
}


