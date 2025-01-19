//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView: View {
    @State var meetingDetailData: MeetingDetailData
    @State var memberData: MeetingRoomMemberData
    @State var commentData: MeetingRoomCommentData
    let items = ["HEEEUN", "MS", "NY"]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    MeetingChip(state: .recruiting(.closed))
                    MeetingChip(state: .category(.DINING))
                    MeetingChip(state: .weekly(true))
                }
                .padding(.top, 18)
                .padding(.bottom, 6)
                
                Text(meetingDetailData.groupTitle)
                    .pretendardFont(.title1_b_20)
                    .foregroundColor(.grayWhite)
                    .lineLimit(nil)
                    .padding(.bottom, 12)
                
                TimeBox(state: .white, text: String(meetingDetailData.startTime), font: .pretendard(.caption2_r_12))
                    .padding(.bottom, 2)
                
                LocationBox(state: .white, text: meetingDetailData.location, font: .pretendard(.caption2_r_12))
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Image("sample")
                    .resizable()
                    .scaledToFill()
            )
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(.icPeople18)
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.gray06)
                    Text("멤버 (\(meetingDetailData.currentPeopleCount)/\(meetingDetailData.maxPeopleCount)명)")
                        .pretendardFont(.title2_sb_18)
                        .foregroundStyle(.gray10)
                }
                .padding(.top, 16)
                .padding(.bottom, 12)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.grayWhite)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(memberData.members.indices, id: \.self) { index in
                        MemberProfileBox(meetingRoomMember: dummyMeetingRoomMemberData.members[index])
                    }
                }
                .padding(.horizontal, 9)
                .padding(.bottom, 16)
            }
            .background(.grayWhite)
            Color.gray02.frame(height: 8)
            
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text("댓글 \(commentData.commentCount)개")
                            .pretendardFont(.body1_sb_16)
                            .frame(alignment: .leading)
                            .padding(.vertical, 16)
                        Spacer()
                        Button(action: {}) {
                            Image(.icRefresh32)
                                .foregroundStyle(.gray05)
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                    
                    ScrollView {
                        VStack(alignment:.leading, spacing: 0) {
                            ForEach (commentData.comments.indices, id: \.self) { index in
                                CommentCell(comment: commentData.comments[index])
                            }
                        }
                        .padding(.horizontal, 16)
                        .background(.grayWhite)
                    }
                    CommentTextField()
                }
            }
        }
    }
}

#Preview {
    MeetingRoomView(
        meetingDetailData: dummymeetingDetailData,
        memberData: dummyMeetingRoomMemberData,
        commentData: dummyMeetingRoomCommentData
    )
}
