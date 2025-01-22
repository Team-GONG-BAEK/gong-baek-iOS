//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView: View {
    @StateObject var viewModel: MeetingRoomViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.meetingStates.indices, id: \.self) { index in
                                MeetingChip(state: viewModel.meetingStates[index])
                            }
                        }
                        .padding(.top, 18)
                        .padding(.bottom, 6)
                        
                        Text(viewModel.meetingDetailData.groupTitle)
                            .pretendardFont(.title1_b_20)
                            .foregroundColor(.grayWhite)
                            .lineLimit(nil)
                            .padding(.bottom, 12)
                        
                        TimeBox(
                            state: .white,
                            text: Date.formattedDateAndStartEndTime(
                                weekDay: WeekDay(viewModel.meetingDetailData.weekDay),
                                weekDate: viewModel.meetingDetailData.weekDate,
                                startTime: viewModel.meetingDetailData.startTime,
                                endTime: viewModel.meetingDetailData.endTime
                            ),
                            font: .pretendard(.caption2_r_12)
                        )
                        .padding(.bottom, 2)
                        
                        LocationBox(state: .white, text: viewModel.meetingDetailData.location, font: .pretendard(.caption2_r_12))
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
                            
                            Text(viewModel.memberCount)
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
                            if let memberData = viewModel.memberData {
                                ForEach(memberData.members.indices, id: \.self) { index in
                                    MemberProfileBox(memberData: memberData.members[index])
                                }
                            }
                        }
                        .padding(.horizontal, 9)
                        .padding(.bottom, 16)
                    }
                    .background(.grayWhite)
                    
                    divider()
                    
                    viewModel.isCommentDisabled ? CommentDisabledBox() : nil
                    
                    CommentList(
                        commentCount: $viewModel.commentData.commentCount,
                        comments: $viewModel.commentData.comments,
                        isScrolled: false,
                        onTapRefreshButton: nil
                    )
                }
            }
            viewModel.isCommentDisabled ? nil : CommentTextField()
        }
        .onAppear {
            viewModel.getMembers(groupId: 1, groupType: "ONCE") {_ in
            }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
