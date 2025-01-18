//
//  MeetingInfoBasic.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct Meeting {
    let status: String
    let category: String
    let coverImg: String
    let groupType: String
    let groupTitle: String
    let weekDay: WeekFullDay?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}

//TODO: 더미 삭제
let dummyMeetings: [Meeting] = [
    Meeting(
        status: "모집 중",
        category: "스터디",
        coverImg: "study_sample",
        groupType: "WEEKLY",
        groupTitle: "iOS 개발 스터디",
        weekDay: .monday,
        weekDate: nil,
        startTime: 19.0,
        endTime: 21.0,
        location: "강남 카페"
    ),
    Meeting(
        status: "모집 완료",
        category: "운동",
        coverImg: "workout_sample",
        groupType: "ONE_TIME",
        groupTitle: "주말 테니스 모임",
        weekDay: nil,
        weekDate: "2025-01-20",
        startTime: 10.0,
        endTime: 12.0,
        location: "서울숲 테니스장"
    ),
    Meeting(
        status: "모집 중",
        category: "독서",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "한 달 한 권 독서 모임",
        weekDay: .thursday,
        weekDate: nil,
        startTime: 18.5,
        endTime: 20.5,
        location: "홍대 독서 모임 공간"
    ),
    Meeting(
        status: "진행 중",
        category: "요리",
        coverImg: "sample",
        groupType: "ONE_TIME",
        groupTitle: "이탈리안 요리 클래스",
        weekDay: nil,
        weekDate: "2025-02-10",
        startTime: 14.0,
        endTime: 16.0,
        location: "이태원 쿠킹 스튜디오"
    ),
    Meeting(
        status: "모집 중",
        category: "게임",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "보드게임 같이 할 사람!",
        weekDay: .saturday,
        weekDate: nil,
        startTime: 16.0,
        endTime: 19.0,
        location: "신촌 보드게임 카페"
    ),
    Meeting(
        status: "모집 중",
        category: "운동",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "아침 요가 클래스",
        weekDay: .wednesday,
        weekDate: nil,
        startTime: 7.0,
        endTime: 8.0,
        location: "한강 공원"
    ),
    Meeting(
        status: "모집 중",
        category: "문화",
        coverImg: "sample",
        groupType: "ONE_TIME",
        groupTitle: "미술관 탐방 모임",
        weekDay: nil,
        weekDate: "2025-04-10",
        startTime: 14.0,
        endTime: 17.0,
        location: "리움 미술관"
    ),
    Meeting(
        status: "진행 중",
        category: "봉사",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "유기동물 보호소 봉사",
        weekDay: .sunday,
        weekDate: nil,
        startTime: 10.0,
        endTime: 13.0,
        location: "서울 유기견 보호소"
    ),
    Meeting(
        status: "모집 중",
        category: "영화",
        coverImg: "sample",
        groupType: "ONE_TIME",
        groupTitle: "영화 같이 보기 - 오펜하이머",
        weekDay: nil,
        weekDate: "2025-05-18",
        startTime: 18.0,
        endTime: 21.0,
        location: "CGV 용산 IMAX"
    )
]


struct MeetingInfoBase: View {
    let state: MeetingInfoState
    let meeting: Meeting
    
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
                    MeetingChip(state: .recruiting(.recruiting))
                    MeetingChip(state: .category(.sport))
                    MeetingChip(state: .weekly(true))
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
                            text: Date.formattedDateAndTime(
                                weekDay: meeting.weekDay,
                                weekDate: meeting.weekDate,
                                time: meeting.startTime
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
            
        }
    }
}

#Preview {
    MeetingInfoBase(
        state: .cell, meeting: Meeting(
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
}
