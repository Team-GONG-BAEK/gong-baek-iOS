//
//  HomeView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = HomeViewModel()
    private var enterButtonState: EnterButtonState {
        if let data = viewModel.upcomingMeetingData {
            return .space(data)
        } else {
            return .filling
        }
    }
    
    var body: some View {
        if viewModel.showErrorView {
            FullErrorView() {
                viewModel.fetchData()
            }
        }
        else {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 34) {
                        header(geometry)
                        meetingList(
                            title: "공강시간에 정기적인 활동 어때요?",
                            subtitle: viewModel.nickname + "님과 딱 맞는 매주 봐요 모임 추천이에요.",
                            highlightText: "매주 봐요",
                            groupType: .WEEKLY
                        )
                        meetingList(
                            title: "한번만 만나도 특별할 우리",
                            subtitle: "한번만 봐요 모임으로 잊지 못할 추억을 만들어보세요!",
                            highlightText: "한번만 봐요",
                            groupType: .ONCE
                        )
                        banner()
                        perfectMatchMember()
                    }
                    .padding(.bottom, 35)
                }
                .ignoresSafeArea(edges: .top)
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
    
    private func header(_ geometry: GeometryProxy) -> some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 88) {
                schoolNameBar()

                VStack(alignment: .leading, spacing: 6) {
                    Text("다가오는 모임")
                        .pretendardFont(.caption1_sb_13)
                        .foregroundStyle(.mainOrange)

                    meetingInfo()
                }
            }
            .padding(.top, geometry.safeAreaInsets.top + 14)

            enterSpaceButton()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 26)
        .background(
            Image(.imgHomeMain)
                .resizable()
        )
    }
    
    private func meetingList(
        title: String,
        subtitle: String,
        highlightText: String,
        groupType: GroupState
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HomeTitleTextBox(
                title: title,
                subtitle: subtitle,
                highlightSubtitleText: highlightText
            )
            .padding(.horizontal, 16)
            
            /// 서버 통신 전, 데이터가 nil일 때
            if let oneTimeMeetingList = viewModel.oneTimeMeetingList,
               let weeklyMeetingList = viewModel.weeklyMeetingList {
                switch groupType {
                case .ONCE:
                    /// 서버 통신 후, 데이터가 empty일 때
                    if oneTimeMeetingList.isEmpty {
                        HomeListEmptyView(type: groupType)
                            .padding(.horizontal, 16)
                    }
                    /// 서버 통신 후, 데이터가 1개 이상 존재할 때
                    else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 10) {
                                meetingCells(
                                    meetingList: oneTimeMeetingList,
                                    groupType: groupType
                                )
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                case .WEEKLY:
                    if weeklyMeetingList.isEmpty {
                        HomeListEmptyView(type: groupType)
                            .padding(.horizontal, 16)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 10) {
                                meetingCells(
                                    meetingList: weeklyMeetingList,
                                    groupType: groupType
                                )
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
        }
    }
    
    private func banner() -> some View {
        Image(.imgHomeBanner)
            .resizable()
            .scaledToFill()
    }
    
    private func perfectMatchMember() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HomeTitleTextBox(
                title: "나와 딱 맞는 공백 멤버",
                subtitle: "공백 시간에 이 멤버들과 공백 활동 어때요?"
            )
                
            Image(.imgHomeComingsoon)
                .resizable()
                .scaledToFill()
            
        }
        .padding(.horizontal, 16)
    }
    
    private func schoolNameBar() -> some View {
        HStack {
            Image(.icSchool20)
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(viewModel.schoolName)
                .pretendardFont(.body1_m_16)
                .foregroundStyle(.gray03)
            
            Spacer()
            
            Image(.icNotification20)
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
    
    private func meetingInfo() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(enterButtonState.upcomingMeetingTitle)
                .pretendardFont(.title1_b_20)
                .foregroundStyle(.grayWhite)
            
            HStack(spacing: 4) {
                Image(.icTime16)
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(enterButtonState.upcomingMeetingDate)
                    .pretendardFont(.caption2_m_12)
                    .foregroundStyle(.gray05)
            }
        }
    }
    
    private func enterSpaceButton() -> some View {
        Button {
            switch enterButtonState {
            case .space(let data):
                navigationManager.push(
                    view: MeetingRoomDestination.meetingRoom(
                        groupId: data.groupId,
                        groupType: data.groupType
                    )
                )
            case .filling:
                navigationManager.selectedTab = .filling
            }
        } label: {
            Text(enterButtonState.title)
                .pretendardFont(.caption2_b_12)
                .foregroundStyle(.grayWhite)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
        }
        .background(.mainOrange)
        .clipShape(
            RoundedRectangle(cornerRadius: 4)
        )
    }
    
    private func meetingCells(
        meetingList: [JoinableMeetingModel],
        groupType: GroupState
    ) -> some View {
        ForEach(meetingList, id: \.groupId) { data in
            HomeMeetingCell(
                data: data,
                groupType: groupType
            )
            .frame(maxHeight: .infinity)
            .onTapGesture {
                groupType == .WEEKLY
                ? navigationManager.push(
                    view: MeetingDetailDestination.meetingDetail(
                        groupId: data.groupId,
                        groupType: data.groupType
                    ))
                : navigationManager.push(
                    view: MeetingDetailDestination.meetingDetail(
                        groupId: data.groupId,
                        groupType: data.groupType
                    ))
            }
        }
    }
}

#Preview {
    HomeView()
}
