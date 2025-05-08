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
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            }
            
            if let alertType = viewModel.alertType {
                alert(type: alertType)
            }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}

extension MeetingDetailView {
    
    @ViewBuilder
    private func alert(type: MeetingDetailAlertType) -> some View {
        switch type {
        case .apply:
            CustomedAlert(
                alertImage: "img_success",
                titleText: "신청이 완료됐어요!",
                subtitleText: "생성자에 의해 모임이 삭제될 수도 있어요.",
                grayButtonText: "닫기",
                orangeButtonText: "스페이스 바로가기",
                onTapGrayButton: {
                    viewModel.alertType = nil
                },
                onTapOrangeButton: {
                    viewModel.alertType = nil
                    navigationManager.push(
                        view: MeetingRoomDestination.meetingRoom(
                            groupId: groupId,
                            groupType: groupType
                        )
                    )
                }
            )
        case .recruited:
            CustomedAlert(
                alertImage: "img_fail" ,
                titleText: "인원이 마감되어 신청이 불가능해요!",
                subtitleText: "아쉽지만, 다른 모임을 찾아보세요.",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                }
            )
        case .cancel:
            CustomedAlert(
                alertImage: "img_fail",
                titleText: "모임 신청이 취소되었어요!",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                })
        case .delete:
            CustomedAlert(
                alertImage: "img_fail",
                titleText: "모임을 삭제하시겠습니까?" ,
                subtitleText: "삭제된 모임은 복구가 불가합니다.",
                grayButtonText: "닫기",
                orangeButtonText: "삭제하기",
                onTapGrayButton: {
                    viewModel.alertType = nil
                },
                onTapOrangeButton: {
                    viewModel.deleteMyMeeting(groupId: groupId, groupType: groupType) {
                        navigationManager.pop()
                    }
                    viewModel.alertType = nil
                })
        case .error(let isGetMethod):
            CustomedAlert(
                alertImage: "img_fail" ,
                titleText: isGetMethod ? "앗! 데이터를 불러오지 못했어요." : "일시적인 오류가 발생했습니다.",
                subtitleText: isGetMethod ? "잠시 후 다시 시도해주세요." : "잠시 후 다시 시도해주세요.",
                orangeButtonText: isGetMethod ? "확인" : "닫기",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                }
            )
        case .fullErrorView:
            FullErrorView(onTapRetryButton: {
                viewModel.alertType = nil
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            })
            .customNavigationBar(showBackButton: true)
        }
    }
}
