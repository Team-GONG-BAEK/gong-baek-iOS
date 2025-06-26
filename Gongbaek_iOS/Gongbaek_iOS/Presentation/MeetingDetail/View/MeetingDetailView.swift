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
                if let meetingData = viewModel.meetingDetailData {
                    MeetingInfoBase(
                        state: .detail,
                        meeting: viewModel.meeting(for: meetingData)
                    )
                    .padding(16)
                }
                
                divider()
                
                MeetingDetailSegmentControlBar(viewModel: viewModel)
            }
            .customNavigationBar(
                viewName: "채우기",
                showBackButton: true,
                rightButtonType: .report
            ) {
                viewModel.alertType = .meetingReport
            }
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
            GongbaekAlert(
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
            GongbaekAlert(
                alertImage: "img_fail" ,
                titleText: "인원이 마감되어 신청이 불가능해요!",
                subtitleText: "아쉽지만, 다른 모임을 찾아보세요.",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                }
            )
        case .cancel:
            GongbaekAlert(
                alertImage: "img_fail",
                titleText: "모임 신청이 취소되었어요!",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.alertType = nil
                })
        case .delete:
            GongbaekAlert(
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
                        navigationManager.rootView = .tabBar
                        navigationManager.selectedTab = .myPage
                    }
                    viewModel.alertType = nil
                })
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
                viewName: "채우기",
                showBackButton: true
            )
        case .meetingReport:
            BasicAlert(
                title: "해당 모임을 신고하겠습니까?",
                subtitle: "모임을 신고할 경우,\n운영팀에서 검토를 거쳐 24시간 내에\n적절한 조치 및 게시자 제재를 취할 것입니다.",
                grayButtonText: "취소",
                orangeButtonText: "신고하기",
                onTapGrayButton: {
                    viewModel.alertType = nil
                },
                onTapOrangeButton: {
                    // TODO: 모임 신고 API 연결
                    viewModel.alertType = nil
                }
            )
        case .commentReport(let commentId):
            BasicAlert(
                title: "해당 댓글을 신고하겠습니까?",
                subtitle: "댓글을 신고할 경우,\n해당 유저는 차단되며\n운영팀에서 검토를 거쳐 제재를 취할것입니다.",
                grayButtonText: "취소",
                orangeButtonText: "신고하기",
                onTapGrayButton: {
                    viewModel.alertType = nil
                },
                onTapOrangeButton: {
                    viewModel.reportComment(commentId: commentId)
                    viewModel.alertType = nil
                }
            )
        }
    }
}
