//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

import Combine

struct MeetingRoomView: View {
    @StateObject var viewModel: MeetingRoomViewModel
    let groupId: Int
    let groupType: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                if let meetingData = viewModel.meetingDetailData,
                   let commentData = viewModel.commentData {
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            headerCoverImage(
                                category: meetingData.category,
                                coverImageIndex: meetingData.coverImg,
                                safeAreaTopInset: geometry.safeAreaInsets.top
                            )
                            .overlay(
                                VStack(alignment: .leading, spacing: 0) {
                                    meetingChips()
                                    meetingTitle(meetingData.groupTitle)
                                    
                                    TimeBox(
                                        state: .white,
                                        text: Date.formattedDateAndStartEndTime(
                                            weekDay: WeekDay(meetingData.weekDay),
                                            weekDate: meetingData.weekDate,
                                            startTime: meetingData.startTime,
                                            endTime: meetingData.endTime
                                        ),
                                        font: .caption2_r_12
                                    )
                                    .padding(.bottom, 2)
                                    
                                    LocationBox(
                                        state: .white,
                                        text: meetingData.location,
                                        font: .caption2_r_12
                                    )
                                }
                                .padding(.top, geometry.safeAreaInsets.top + 48 + 18)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            )
                            
                            meetingMembers(
                                current: meetingData.currentPeopleCount,
                                max: meetingData.maxPeopleCount
                            )
                            divider()
                            viewModel.isCommentDisabled ? CommentDisabledBox() : nil
                        }
                        
                        CommentList(
                            meetingRoomViewModel: viewModel,
                            commentCount: commentData.commentCount,
                            comments: commentData.comments,
                            isScrolled: false
                        )
                        .frame(maxHeight: .infinity)
                    }
                    .ignoresSafeArea()
                    
                    viewModel.isCommentDisabled ? nil : CommentTextField(viewModel: viewModel)
                }
            }
            .customNavigationBar(
                isMeetingRoom: viewModel.alertType == .fullErrorView ? false : true,
                showBackButton: true
            )
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            }
            
            if let alertType = viewModel.alertType {
                alert(type: alertType)
            }
        }
    }
}

private extension MeetingRoomView {
    
    func headerCoverImage(
        category: String,
        coverImageIndex: Int,
        safeAreaTopInset: CGFloat
    ) -> some View {
        let height = safeAreaTopInset + 48 + 134
        return Group {
            if let category = CategoryState(category) {
                Image(category.coverImage[coverImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(height: height)
                    .clipped()
                    .overlay(
                        Rectangle()
                            .fill(Color.grayBlack.opacity(0.5))
                            .frame(height: height),
                        alignment: .center
                    )
            }
            else {
                Rectangle()
                    .fill(.gray01)
                    .frame(height: height)
            }
        }
    }
    
    func meetingChips() -> some View {
        HStack(spacing: 5) {
            ForEach(viewModel.meetingStates.indices, id: \.self) { index in
                MeetingChip(state: viewModel.meetingStates[index])
            }
        }
    }
    
    func meetingTitle(_ title: String) -> some View {
        Text(title)
            .pretendardFont(.title1_b_20)
            .foregroundColor(.grayWhite)
            .lineLimit(nil)
            .padding(.top, 6)
            .padding(.bottom, 12)
    }
    
    func meetingMembers(current: Int, max: Int) -> some View {
        VStack(spacing: 0) {
            memberTitle(current, max)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    if let memberData = viewModel.memberData {
                        ForEach(memberData.members.indices, id: \.self) { index in
                            MemberProfileBox(memberData: memberData.members[index])
                        }
                    }
                }
                .padding(.horizontal, 7)
                .padding(.bottom, 16)
            }
        }
    }
    
    func memberTitle(_ current: Int, _ max: Int) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(.icPeople18)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.gray06)
                
                Text("멤버 (\(current)/\(max)명)")
                    .pretendardFont(.title2_sb_18)
                    .foregroundStyle(.gray10)
            }
            .padding(.top, 16)
            .padding(.bottom, 12)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
    
    @ViewBuilder
    func alert(type: MeetingRoomAlertType) -> some View {
        switch type {
        case .error:
            GongbaekAlert(
                alertImage: "img_fail" ,
                titleText: "일시적인 오류가 발생했습니다.",
                subtitleText: "잠시 후 다시 시도해주세요.",
                orangeButtonText: "닫기",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                }
            )
        case .fullErrorView:
            FullErrorView(onTapRetryButton: {
                viewModel.alertType = nil
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            })
            .customNavigationBar(
                viewName: viewModel.alertType == .fullErrorView ? "스페이스" : nil,
                showBackButton: true
            )
        }
    }
}
