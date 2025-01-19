//
//  MeetingInfoCell.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MeetingInfoCell: View {
    @State private var selectedButton: String?
    let meeting: Meeting
    let state: MeetingInfoState.FillItemState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MeetingInfoBase(state: .cell, meeting: meeting)
            
            if state == .myFill {
                HStack(spacing: 0) {
                    MyFillCellButton(text: "작성글 보기")
                    Rectangle()
                        .fill(.gray03)
                        .frame(width: 1, height: 14)
                    MyFillCellButton(text: "스페이스 입장하기")
                }
                .background(.gray01)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        Rectangle()
            .fill(.gray01)
            .frame(height: 1)
    }
    
}



#Preview {
    MeetingInfoCell(
        meeting: Meeting(
            status: "모집 중",
            category: "스터디",
            coverImg: "sample",
            groupType: "소규모",
            groupTitle: "나는 개바보다 나랑 친구하고 싶으면 들어오덩가 ㅋㅋㅋ",
            weekDay: .monday,
            weekDate: nil,
            startTime: 13.0,
            endTime: 15.0,
            location: "학교 정문인데 어쩌구 저쩌구 20자 넘으면"
        ),
        state: .myFill
    )
}

