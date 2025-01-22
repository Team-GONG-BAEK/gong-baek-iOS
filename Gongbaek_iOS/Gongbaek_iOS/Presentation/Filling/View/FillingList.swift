//
//  FillingList.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/17/25.
//

import SwiftUI

struct FillingList: View {
    @ObservedObject var viewModel = FillingViewModel()
    
    let meetings: [Meeting] = dummyMeetings
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 6) {
                    CycleButton(state: .all)
                        .disabled(true)
                    
                    Spacer()
                    
                    Text(viewModel.isToggleOn ? "겹치는 공백" : "모든 공백")
                        .font(.pretendard(.caption2_r_12))
                        .foregroundColor(.gray06)
                    ToggleButton(isOn: $viewModel.isToggleOn, isDisabled: true)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                VStack(alignment:.leading, spacing: 0) {
                    ForEach(meetings, id: \.groupTitle) { meeting in
                        MeetingInfoCell(meeting: meeting, state: .fill)
                    }
                }
            }
        }
    }
}


#Preview {
    FillingList()
}

let dummyMeetings: [Meeting] = [
    Meeting(
        groupId: 1,
        status: "RECRUITING",
        category: "STUDY",
        coverImg: 1,
        groupType: "WEEKLY",
        groupTitle: "공강팅",
        weekDay: "MON",
        weekDate: nil,
        startTime: 10.5,
        endTime: 12.0,
        location: "학교 정문"
    ),
    Meeting(
        groupId: 2,
        status: "RECRUITIED",
        category: "PLAYING",
        coverImg: 3,
        groupType: "ONCE",
        groupTitle: "공강팅",
        weekDay: "TUE",
        weekDate: "2025-12-11",
        startTime: 10.5,
        endTime: 12.0,
        location: "학교 정문"
    )
]
