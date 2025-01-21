//
//  MeetingModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import Foundation

struct MeetingModel {
    let groupId: Int
    let category: String
    let coverImg: Int
    let profileImg: Int
    let groupType: String
    let groupTitle: String
    let weekDate: String
    let groupDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}

extension MeetingModel {
    
    static func weeklyMeetingList() -> [MeetingModel] {
        [
            MeetingModel(
                groupId: 0,
                category: "DINING",
                coverImg: 4,
                profileImg: 2,
                groupType: "WEEKLY",
                groupTitle: "같이 저녁 먹을 사람들 구합니다",
                weekDate: "FRI",
                groupDate: nil,
                startTime: 17.0,
                endTime: 18.0,
                location: "학교 정문 앞"
            ),
            MeetingModel(
                groupId: 1,
                category: "STUDY",
                coverImg: 2,
                profileImg: 5,
                groupType: "WEEKLY",
                groupTitle: "웹프 들으시는분 같이 과제해요ㅜㅜ",
                weekDate: "THU",
                groupDate: nil,
                startTime: 11.5,
                endTime: 13.0,
                location: "이디야/스터디룸"
            ),
            MeetingModel(
                groupId: 2,
                category: "PLAYING",
                coverImg: 5,
                profileImg: 2,
                groupType: "WEEKLY",
                groupTitle: "🤭 보드게임 좋아하는 사람들 모임",
                weekDate: "TUE",
                groupDate: nil,
                startTime: 13.5,
                endTime: 16.0,
                location: "레드버튼 보드게임카페"
            ),
            MeetingModel(
                groupId: 3,
                category: "NETWORKING",
                coverImg: 1,
                profileImg: 1,
                groupType: "WEEKLY",
                groupTitle: "매주 만나서 수다떨고 친해져욥",
                weekDate: "MON",
                groupDate: nil,
                startTime: 15.0,
                endTime: 16.0,
                location: "근처 카페"
            ),
            MeetingModel(
                groupId: 4,
                category: "EXERCISE",
                coverImg: 3,
                profileImg: 2,
                groupType: "WEEKLY",
                groupTitle: "30분 뒤에 농구하러 오실분",
                weekDate: "WED",
                groupDate: nil,
                startTime: 14.0,
                endTime: 16.0,
                location: "공학관 옆 농구장"
            )
        ]
    }
    
    static func oneTimeMeetingList() -> [MeetingModel] {
        [
            MeetingModel(
                groupId: 0,
                category: "DINING",
                coverImg: 4,
                profileImg: 2,
                groupType: "ONCE",
                groupTitle: "같이 저녁 먹을 사람들 구합니다",
                weekDate: "FRI",
                groupDate: "2025-04-07",
                startTime: 17.0,
                endTime: 18.0,
                location: "학교 정문 앞"
            ),
            MeetingModel(
                groupId: 1,
                category: "STUDY",
                coverImg: 2,
                profileImg: 5,
                groupType: "ONCE",
                groupTitle: "시험기간 모각작인데 개빡세게하실분 모집",
                weekDate: "THU",
                groupDate: "2025-04-14",
                startTime: 11.5,
                endTime: 13.0,
                location: "이디야/스터디룸"
            ),
            MeetingModel(
                groupId: 2,
                category: "PLAYING",
                coverImg: 5,
                profileImg: 2,
                groupType: "ONCE",
                groupTitle: "🤭 보드게임 좋아하는 사람들 모임",
                weekDate: "TUE",
                groupDate: "2025-03-16",
                startTime: 13.5,
                endTime: 16.0,
                location: "레드버튼 보드게임카페"
            ),
            MeetingModel(
                groupId: 3,
                category: "NETWORKING",
                coverImg: 1,
                profileImg: 1,
                groupType: "ONCE",
                groupTitle: "친구없는 모임.....친해져욥",
                weekDate: "MON",
                groupDate: "2025-03-30",
                startTime: 15.0,
                endTime: 16.0,
                location: "근처 카페"
            ),
            MeetingModel(
                groupId: 4,
                category: "EXERCISE",
                coverImg: 3,
                profileImg: 2,
                groupType: "ONCE",
                groupTitle: "30분 뒤에 농구하러 오실분",
                weekDate: "WED",
                groupDate: "2025-06-30",
                startTime: 14.0,
                endTime: 16.0,
                location: "공학관 옆 농구장"
            )
        ]
    }
}
