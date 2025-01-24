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
                                view: MeetingRoomDestination.meetingRoom(
                                    groupId: groupId,
                                    groupType: groupType
                                ))
                        }
                    }
                )
            }
            
            if viewModel.showPatchAlert {
                CustomedAlert(
                    alertImage: viewModel.isSuccessGetData ? "img_fail" : "img_fail" ,
                    titleText: viewModel.isSuccessGetData ? "모임 신청이 취소되었어요!" : "알 수 없는 이유로 신청 취소가 거부되었습니다.",
                    orangeButtonText: viewModel.isSuccessGetData ? "확인" : "닫기",
                    onTapOrangeButton: {
                        viewModel.showPatchAlert = false
                    }
                )
            }
            
            if viewModel.showDeleteFailureAlert {
                CustomedAlert(
                    alertImage: viewModel.isSuccessGetData ? "img_fail" : "img_fail" ,
                    titleText: viewModel.isSuccessGetData ? "모임이 삭제되었어요!" : "알 수 없는 이유로 삭제가 거부되었습니다.",
                    subtitleText: viewModel.isSuccessGetData ? "다른 모임을 더 등록해보세요!" : nil,
                    orangeButtonText: viewModel.isSuccessGetData ? "완료" : "닫기",
                    onTapOrangeButton: {
                        viewModel.showDeleteFailureAlert = false
                        if viewModel.isSuccessGetData {
                            navigationManager.pop()
                        }
                    }
                )
            }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
