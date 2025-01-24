//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = MeetingDetailViewModel()
    let groupId: Int
    let groupType: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MeetingInfoBase(
                    state: .detail,
                    meeting: viewModel.meeting)
                .padding(16)
                
                divider()
                
                MeetingDetailSegmentControlBar(viewModel: viewModel)
            }
            .customNavigationBar(showBackButton: true)
            .onAppear {
                viewModel.getDetails(groupId: groupId, groupType: groupType) { _ in }
                viewModel.getOwnerInfo(groupId: groupId, groupType: groupType) { _ in }
                viewModel.getComments(groupId: groupId, groupType: groupType) { _ in }
            }
            
            if viewModel.showAlert {
                CustomedAlert(
                    alertImage: viewModel.isSuccessGetData ? "img_success" : "img_fail" ,
                    titleText: viewModel.isSuccessGetData ? "신청이 완료됐어요!" : "인원이 마감되어 신청이 불가능해요!",
                    subtitleText: viewModel.isSuccessGetData ? "생성자에 의해 모임이 삭제될 수도 있어요." : "아쉽지만, 다른 모임을 찾아보세요.",
                    grayButtonText: viewModel.isSuccessGetData ? "닫기" : nil,
                    orangeButtonText: viewModel.isSuccessGetData ? "스페이스 바로가기" : "확인",
                    onTapGrayButton: {
                        viewModel.showAlert = false
                    },
                    onTapOrangeButton: {
                        viewModel.showAlert = false
                        if viewModel.isSuccessGetData {
                            navigationManager.push(
                                view: MeetingDetailDestination.meetingDetail(
                                    groupId: groupId,
                                    groupType: groupType
                                ))
                        }
                    }
                )
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
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
