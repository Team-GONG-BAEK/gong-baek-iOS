//
//  FillingModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import Foundation

struct Meeting {
    let groupId: Int
    let status: String
    let category: String
    let coverImg: Int
    let groupType: String
    let groupTitle: String
    let weekDay: WeekDay?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}

let dummyMeetings: [Meeting] = [
//    Meeting(
//        groupId: 1,
//        status: "RECRUITING",
//        category: "STUDY",
//        coverImg: 1,
//        groupType: "WEEKLY",
//        groupTitle: "iOS 개발 스터디",
//        weekDay: .MON,
//        weekDate: nil,
//        startTime: 19.0,
//        endTime: 21.0,
//        location: "강남 카페"
//    ),
//    Meeting(
//        groupId: 2,
//        status: "CLOSED",
//        category: "EXERCISE",
//        coverImg: 2,
//        groupType: "ONCE",
//        groupTitle: "주말 테니스 모임",
//        weekDay: .FRI,
//        weekDate: "2025-01-20",
//        startTime: 10.0,
//        endTime: 12.0,
//        location: "서울숲 테니스장"
//    ),
//    Meeting(
//        groupId: 3,
//        status: "RECRUITED",
//        category: "BOOK",
//        coverImg: 3,
//        groupType: "WEEKLY",
//        groupTitle: "한 달 한 권 독서 모임",
//        weekDay: .THU,
//        weekDate: nil,
//        startTime: 18.5,
//        endTime: 20.5,
//        location: "홍대 독서 모임 공간"
//    )
]
