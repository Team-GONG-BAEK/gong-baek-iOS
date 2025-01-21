//
//  MeetingInfoBasic.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct MeetingInfoBase: View {
    @Binding var state: MeetingInfoState
    @Binding var meeting: Meeting
//    let state: MeetingInfoState
//    let meeting: Meeting
//
    
    var body: some View {
        HStack(spacing: 12) {
            Image(meeting.coverImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 102, height: 102)
                .cornerRadius(2)
            
            VStack(alignment: .leading, spacing: 6) {
                // 모임 태그
                HStack(spacing: 4) {
                    MeetingChip(state: .recruiting(RecruitingState(from: meeting.status)))
                    MeetingChip(state: .category(CategoryState(from: meeting.category)))
                    MeetingChip(state: .weekly(GroupState(from: meeting.groupType)))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    // 모임 제목
                    Text(meeting.groupTitle)
                        .font(state.titleFont)
                        .lineLimit(1)
                    
                    // 모임 정보
                    VStack(alignment: .leading, spacing: 2) {
                        TimeBox(
                            state: .gray,
                            text: Date.formattedDateAndStartEndTime(
                                weekDay: meeting.weekDay,
                                weekDate: meeting.weekDate,
                                startTime: meeting.startTime,
                                endTime: meeting.endTime
                            ),
                            font: state.infoFont
                        )
                        LocationBox(
                            state: .gray,
                            text: meeting.location,
                            font: state.infoFont
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    MeetingInfoBase(
        state: .constant(.cell), meeting: .constant(Meeting(
            status: "RECRUITING",
            category: "STUDY",
            coverImg: "sample",
            groupType: "WEEKLY",
            groupTitle: "나는 개바보다 나랑 친구하고 싶으면 들어오덩가 ㅋㅋㅋ",
            weekDay: .MON,
            weekDate: nil,
            startTime: 13.0,
            endTime: 15.0,
            location: "학교 정문인데 어쩌구 저쩌구 20자 넘으면"
        )))
}

#Preview {
    MeetingDetailView(
        meetingDetailData: dummymeetingDetailData,
        ownerInfoData: dummyOwnerInfoData,
        commentData: dummyCommentData
    )
}
