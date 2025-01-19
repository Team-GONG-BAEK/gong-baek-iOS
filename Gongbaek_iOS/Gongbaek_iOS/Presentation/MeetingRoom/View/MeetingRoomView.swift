//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView {
    var body: some View {
        HStack {
            MeetingChip(state: .recruiting(.closed))
            MeetingChip(state: .category(.DINING))
            MeetingChip(state: .weekly(true))
        }
    }
}
