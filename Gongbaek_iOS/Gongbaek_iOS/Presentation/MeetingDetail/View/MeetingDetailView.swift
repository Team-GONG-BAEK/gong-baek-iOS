//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @State var meetingDetailData: MeetingDetailModel
    @State var ownerInfoData: OwnerInfoModel
    @State var commentData: CommentModel
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .detail,
                meeting: .init(
                    status: "CLOSED",
                    category: meetingDetailData.category,
                    coverImg: "sample",//TODO: Int로 넘기기 meetingDetailData.coverImg,
                    groupType: meetingDetailData.groupType,
                    groupTitle: meetingDetailData.groupTitle,
                    weekDay: .monday,//TODO: meetingDetail.weekDay,
                    weekDate: meetingDetailData.weekDate,
                    startTime: meetingDetailData.startTime,
                    endTime: meetingDetailData.endTime,
                    location: meetingDetailData.location
                )
            )
            .padding(16)
            
            Color.gray02.frame(height: 8)
            
            MeetingDetailSegmentControlBar(
                introduction: $meetingDetailData.introduction,
                ownerInfo: $ownerInfoData,
                commentData: $commentData,
                currentPeopleCount: $meetingDetailData.currentPeopleCount,
                maxPeopleCount: $meetingDetailData.maxPeopleCount,
                meetingStatus: $meetingDetailData.status
            )
        }
    }
}

#Preview {
    MeetingDetailView(
        meetingDetailData: dummymeetingDetailData,
        ownerInfoData: dummyOwnerInfoData,
        commentData: dummyCommentData
    )
}
