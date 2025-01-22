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
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 34) {
                    header(geometry)
                    meetingList(
                        title: "공강시간에 정기적인 활동 어때요?",
                        subtitle: viewModel.nickname + "님과 딱 맞는 매주 봐요 모임 추천이에요.",
                        highlightText: "매주 봐요",
                        isWeekly: true
                    )
                    meetingList(
                        title: "한번만 만나도 특별할 우리",
                        subtitle: "한번만 봐요 모임으로 잊지 못할 추억을 만들어보세요!",
                        highlightText: "한번만 봐요",
                        isWeekly: false
                    )
                    banner()
                    perfectMatchMember()
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .onAppear {
            viewModel.getUserProfile()
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
        isWeekly: Bool
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HomeTitleTextBox(
                    title: title,
                    subtitle: subtitle,
                    highlightSubtitleText: highlightText
                )
                .padding(.horizontal, 16)
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.weeklyMeetingList, id: \.groupId) { data in
                        HomeMeetingCell(
                            data: data,
                            isWeekly: isWeekly
                        )
                        .onTapGesture {
                            // TODO: 모임 상세 화면 내비게이션 이동
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    private func banner() -> some View {
        Image(.imgHomeBanner)
            .resizable()
            .scaledToFill()
            .padding(.top, 2)
    }
    
    private func perfectMatchMember() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HomeTitleTextBox(
                    title: "나와 딱 맞는 공백 멤버",
                    subtitle: "공백 시간에 이 멤버들과 공백 활동 어때요?"
                )
                
                Spacer()
            }
            
            LazyVStack(spacing: 0) {
                ForEach(viewModel.perfectMatchMemberList, id: \.nickname) { data in
                    HomeMatchMemberListCell(data: data)
                }
            }
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
            Text("화석의 튜스데이 점심클럽")
                .pretendardFont(.title1_b_20)
                .foregroundStyle(.grayWhite)
            
            HStack(spacing: 4) {
                Image(.icTime16)
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text("12/6 수요일 14시 30분 - 16시 20분")
                    .pretendardFont(.caption2_m_12)
                    .foregroundStyle(.gray05)
            }
        }
    }
    
    private func enterSpaceButton() -> some View {
        Button {
            // TODO: 모임방 내비게이션 화면 이동
        } label: {
            Text("스페이스 입장")
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
}

#Preview {
    HomeView()
}
