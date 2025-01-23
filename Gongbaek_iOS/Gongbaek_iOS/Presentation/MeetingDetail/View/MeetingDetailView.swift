//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @StateObject var viewModel = MeetingDetailViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .constant(.detail),
                meeting: .constant(Meeting(
                    groupId: 0, status: viewModel.meetingDetailData?.status ?? "",
                    category: viewModel.meetingDetailData?.category ?? "",
                    coverImg: 5,//TODO: Int로 넘기기 meetingDetailData.coverImg,
                    groupType: viewModel.meetingDetailData?.groupType ?? "",
                    groupTitle: viewModel.meetingDetailData?.groupTitle ?? "",
                    weekDay: viewModel.meetingDetailData?.weekDay ?? "",
                    weekDate: viewModel.meetingDetailData?.weekDate ?? "",
                    startTime: viewModel.meetingDetailData?.startTime ?? 0,
                    endTime: viewModel.meetingDetailData?.endTime ?? 0,
                    location: viewModel.meetingDetailData?.location ?? ""
                )))
            .padding(16)
            
            divider()
            
            MeetingDetailSegmentControlBar(viewModel: viewModel)
        }
        .onAppear {
            print("onAppear called")
            //TODO: Navigation 연결 시 수정
            viewModel.getDetails(groupId: 8, groupType: "WEEKLY") { _ in
                print("getDetails finished, meetingDetailData: \(String(describing: viewModel.meetingDetailData))")
            }
            
            viewModel.getOwnerInfo(groupId: 8, groupType: "WEEKLY") { _ in
                print("getOwnerInfo finished, ownerInfoData: \(String(describing: viewModel.ownerInfoData))")
            }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}

//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
//
//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDateDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
