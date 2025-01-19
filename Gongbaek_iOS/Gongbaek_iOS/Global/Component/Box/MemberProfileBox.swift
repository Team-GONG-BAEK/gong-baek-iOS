//
//  MemberProfileBlock.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct MemberProfileBox: View {
    let meetingRoomMember: MeetingRoomMember
    
    var body: some View {
        VStack(spacing: 6) {
            Image("\(meetingRoomMember.profileImage)") //TODO: 이미지 네이밍 수정
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .overlay(
                    meetingRoomMember.isHost ? OwnerChip(ownerChipType: .gray09).padding(6) : nil,
                    alignment: .bottomLeading
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.gray02, lineWidth: 1)
                )
                .padding(.horizontal, 7)
 
            Text(meetingRoomMember.nickname)
                .pretendardFont(.caption1_m_13)
                .foregroundStyle(.gray10)
        }
        .background(.grayWhite)
    }
}
