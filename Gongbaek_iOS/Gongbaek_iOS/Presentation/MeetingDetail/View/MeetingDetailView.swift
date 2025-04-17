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
            
            
            applyAlert()
            cancelAlert()
            deleteAlert()
            defaultFullErrorView()
            defaultErrorAlert()
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}

extension MeetingDetailView {
    @ViewBuilder
    func applyAlert() -> some View {
        if viewModel.showRecruitedAlert {
            CustomedAlert(
                alertImage: "img_fail" ,
                titleText: "인원이 마감되어 신청이 불가능해요!",
                subtitleText: "아쉽지만, 다른 모임을 찾아보세요.",
                orangeButtonText: "확인",
                onTapOrangeButton: {
                    viewModel.showRecruitedAlert = false
                }
            )
        }
        else {
            if viewModel.showApplySuccessAlert {
                CustomedAlert(
                    alertImage: viewModel.isSuccessGetData ? "img_success" : "img_fail" ,
                    titleText: viewModel.isSuccessGetData ? "신청이 완료됐어요!" : "일시적인 오류가 발생했습니다.",
                    subtitleText: viewModel.isSuccessGetData ? "생성자에 의해 모임이 삭제될 수도 있어요." : "잠시 후 다시 시도해주세요.",
                    grayButtonText: viewModel.isSuccessGetData ? "닫기" : nil,
                    orangeButtonText: viewModel.isSuccessGetData ? "스페이스 바로가기" : "확인",
                    onTapGrayButton: {
                        viewModel.showApplySuccessAlert = false
                    },
                    onTapOrangeButton: {
                        viewModel.showApplySuccessAlert = false
                        if viewModel.isSuccessGetData {
                            navigationManager
                                .push(
                                    view: MeetingRoomDestination
                                        .meetingRoom(
                                            groupId: groupId,
                                            groupType: groupType
                                        )
                                )
                        }
                    }
                )
            }
        }
    }
    
    @ViewBuilder
    func cancelAlert() -> some View {
        if viewModel.showPatchAlert {
            CustomedAlert(
                alertImage: viewModel.isSuccessGetData ? "img_fail" : "img_fail" ,
                titleText: viewModel.isSuccessGetData ? "모임 신청이 취소되었어요!" : "일시적인 오류가 발생했습니다.",
                subtitleText: viewModel.isSuccessGetData ? nil : "잠시 후 다시 시도해주세요.",
                orangeButtonText: viewModel.isSuccessGetData ? "확인" : "닫기",
                onTapOrangeButton: {
                    viewModel.showPatchAlert = false
                })
        }
    }
    
    @ViewBuilder
    func deleteAlert() -> some View {
        if viewModel.showDeleteAlert {
            CustomedAlert(
                alertImage: viewModel.isSuccessGetData ? "img_fail" : "img_fail" ,
                titleText: viewModel.isSuccessGetData ? "모임을 삭제하시겠습니까?" : "일시적인 오류가 발생했습니다.",
                subtitleText: viewModel.isSuccessGetData ? "삭제된 모임은 복구가 불가합니다." : "잠시 후 다시 시도해주세요.",
                orangeButtonText: viewModel.isSuccessGetData ? "삭제하기" : "닫기",
                onTapOrangeButton: {
                    
                    viewModel.showDeleteAlert = false
                    
                    viewModel.isSuccessGetData ? navigationManager.pop() : nil
                    print("pop")
                })
        }
    }
    
    @ViewBuilder
    func defaultFullErrorView() -> some View {
        if viewModel.showFullErrorView {
            FullErrorView(onTapRetryButton: {
                viewModel.showFullErrorView = false
                
                viewModel.fetchAllData(groupId: groupId, groupType: groupType)
            })
            .customNavigationBar(showBackButton: true)
        }
    }
    
    @ViewBuilder
    func defaultErrorAlert() -> some View {
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
