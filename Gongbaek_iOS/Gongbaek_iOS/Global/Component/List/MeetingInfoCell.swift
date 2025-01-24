//
//  MeetingInfoCell.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MeetingInfoCell: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var selectedButton: String?
    @State var meeting: Meeting
    let state: MeetingInfoState.FillItemState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MeetingInfoBase(state: .cell, meeting: meeting)
                .onTapGesture {
                    state == .fill
                    ? navigationManager.push(
                        view: MeetingDetailDestination.meetingDetail(
                            groupId: meeting.groupId,
                            groupType: meeting.groupType
                        ))
                    : nil
                }
            
            
            if state == .myFill {
                HStack(spacing: 0) {
                    MyFillCellButton(groupId: meeting.groupId, groupType: meeting.groupType, text: "작성글 보기")
                    Rectangle()
                        .fill(.gray03)
                        .frame(width: 1, height: 14)
                    MyFillCellButton(groupId: meeting.groupId, groupType: meeting.groupType, text: "스페이스 입장하기")
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


