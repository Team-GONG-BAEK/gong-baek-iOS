//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: MeetingRoomViewModel
    let groupId: Int
    let groupType: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Group {
                        if let data = viewModel.meetingDetailData,
                           let category = CategoryState(data.category) {
                            Image(category.coverImage[data.coverImg - 1])
                                .resizable()
                                .scaledToFill()
                                .frame(height: 232)
                                .clipped()
                                .overlay(
                                    Rectangle()
                                        .fill(Color.grayBlack.opacity(0.5))
                                        .frame(height: 232),
                                    alignment: .center
                                )
                        }
                        else { Image(.sample)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 232)
                            .clipped() }
                    }
                    .overlay(
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 5) {
                                ForEach(viewModel.meetingStates.indices, id: \.self) { index in
                                    MeetingChip(state: viewModel.meetingStates[index])
                                }                            }
                            .padding(.top, 116)
                            
                            Text(viewModel.groupTitle)
                                .pretendardFont(.title1_b_20)
                                .foregroundColor(.grayWhite)
                                .lineLimit(nil)
                                .padding(.bottom, 12)
                            
                            TimeBox(
                                state: .white,
                                text: Date.formattedDateAndStartEndTime(
                                    weekDay: WeekDay(viewModel.weekDay),
                                    weekDate: viewModel.weekDate,
                                    startTime: viewModel.startTime,
                                    endTime: viewModel.endTime
                                ),
                                font: .pretendard(.caption2_r_12)
                            )
                            .padding(.bottom, 2)
                            LocationBox(state: .white, text: viewModel.location, font: .pretendard(.caption2_r_12))
                        }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                        //                        .background(.grayWhite)
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
                    //                    .background(.grayWhite)
                    
                    divider()
                    
                    viewModel.isCommentDisabled ? CommentDisabledBox() : nil
                }
                
                
                CommentList(
                    meetingRoomViewModel: viewModel,
                    commentCount: viewModel.commentData?.commentCount ?? 0,
                    comments: viewModel.commentData?.comments ?? [],
                    isScrolled: false
                )
                .frame(maxHeight: .infinity)
            }
            .ignoresSafeArea()
            
            viewModel.isCommentDisabled ? nil : CommentTextField(meetingRoomViewModel: viewModel)
        }
        .customNavigationBar(isMeetingRoom: true, showBackButton: true)
        .onAppear {
            viewModel.fetchAllData(groupId: groupId, groupType: groupType)
        }
        
        if viewModel.showFullErrorView {
            FullErrorView(onTapRetryButton: {
                viewModel.showFullErrorView = false
                
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            })
            .customNavigationBar(showBackButton: true)
        }
        
        if viewModel.showErrorAlert {
            CustomedAlert(
                alertImage: "img_fail" ,
                titleText: "앗! 데이터를 불러오지 못했어요.",
                subtitleText: "다시 시도해주세요.",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.showErrorAlert = false
                }
            )
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
