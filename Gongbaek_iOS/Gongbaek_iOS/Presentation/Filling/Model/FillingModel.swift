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
        status: "RECRUITING",
        category: "스터디",
        coverImg: "sample",
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
        coverImg: "sample",
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
        weekDay: "THU",
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
        weekDay: "TUE",
        weekDate: nil,
        startTime: 16.0,
        endTime: 19.0,
        location: "신촌 보드게임 카페"
    ),
    Meeting(
        status: "모집 중",
        category: "음악",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "밴드 합주 모임",
        weekDay: "FRI",
        weekDate: nil,
        startTime: 20.0,
        endTime: 22.0,
        location: "홍대 음악 스튜디오"
    ),
    Meeting(
        status: "진행 중",
        category: "여행",
        coverImg: "sample",
        groupType: "ONE_TIME",
        groupTitle: "국내 여행 번개 모집",
        weekDay: nil,
        weekDate: "2025-03-05",
        startTime: 7.0,
        endTime: 22.0,
        location: "서울 출발 - 강릉 여행"
    ),
    Meeting(
        status: "모집 중",
        category: "운동",
        coverImg: "sample",
        groupType: "WEEKLY",
        groupTitle: "아침 요가 클래스",
        weekDay: "WED",
        weekDate: nil,
        startTime: 7.0,
        endTime: 8.0,
        location: "한강 공원"
    ),
    Meeting(
        status: "모집 완료",
        category: "IT",
        coverImg: "sample",
        groupType: "ONE_TIME",
        groupTitle: "SwiftUI 기초 세미나",
        weekDay: nil,
        weekDate: "2025-02-15",
        startTime: 13.0,
        endTime: 16.0,
        location: "강남 테크 컨퍼런스 룸"
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
        weekDay: "MON",
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
