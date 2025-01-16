//
//  FillingModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import Foundation

struct Meeting {
    let status: String
    let category: String
    let coverImg: String
    let groupType: String
    let groupTitle: String
    let weekDay: String?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}

let dummyMeetings: [Meeting] = [
    Meeting(
        status: "모집 중",
        category: "스터디",
        coverImg: "study_cover",
        groupType: "WEEKLY",
        groupTitle: "iOS 개발 스터디",
        weekDay: "MON",
        weekDate: nil,
        startTime: 19.0,
        endTime: 21.0,
        location: "강남 카페"
    ),
    Meeting(
        status: "모집 완료",
        category: "운동",
        coverImg: "workout_cover",
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
        coverImg: "book_club",
        groupType: "WEEKLY",
        groupTitle: "한 달 한 권 독서 모임",
        weekDay: "THU",
        weekDate: nil,
        startTime: 18.5,
        endTime: 20.5,
        location: "홍대 독서 모임 공간"
    ),
    Meeting(
        status: "진행 중",
        category: "요리",
        coverImg: "cooking_class",
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
        coverImg: "game_meeting",
        groupType: "WEEKLY",
        groupTitle: "보드게임 같이 할 사람!",
        weekDay: "SAT",
        weekDate: nil,
        startTime: 16.0,
        endTime: 19.0,
        location: "신촌 보드게임 카페"
    )
]

