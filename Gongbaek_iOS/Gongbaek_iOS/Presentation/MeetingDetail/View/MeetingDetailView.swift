//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @State var meetingDetail: MeetingDetailData
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .detail,
                meeting: .init(
                    status: "모집 중",
                    category: meetingDetail.category,
                    coverImg: "sample",//TODO: Int로 넘기기
                    groupType: meetingDetail.groupType,
                    groupTitle: meetingDetail.groupTitle,
                    weekDay: .monday,//meetingDetail.weekDay,
                    weekDate: meetingDetail.weekDate,
                    startTime: meetingDetail.startTime,
                    endTime: meetingDetail.endTime,
                    location: meetingDetail.location
                )
            )
            .padding(16)
            
            Color.gray02.frame(height: 8)
            
            CustomSegmentControlBar(segmentState: .detail)
        }
    }
}

#Preview {
    MeetingDetailView(meetingDetail: dummymeetingDetailData)
}
