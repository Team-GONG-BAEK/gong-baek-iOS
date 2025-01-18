//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .detail,
                meeting: .init(
                    status: "모집 중",
                    category: "스터디",
                    coverImg: "sample",
                    groupType: "WEEKLY",
                    groupTitle: "나는 개바보다 나랑 친구하고 싶으면 들어오덩가 ㅋㅋㅋ",
                    weekDay: .monday,
                    weekDate: nil,
                    startTime: 13.0,
                    endTime: 15.0,
                    location: "학교 정문인데 어쩌구 저쩌구 20자 넘으면"
                )
            )
            
            Color.gray02.frame(height: 8)
            
            CustomSegmentControlBar(segmentState: .detail)
            
//            meetingInfo
//            commentView

        }
    }
}

#Preview {
    MeetingDetailView()
}
