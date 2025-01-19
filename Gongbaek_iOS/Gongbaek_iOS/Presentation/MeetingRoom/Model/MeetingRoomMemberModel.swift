//
//  MeetingRoomMemberModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct MeetingRoomMemberData {
    let maxPeopleCount: Int
    let currentPeopleCount: Int
    let members: [MeetingRoomMember]
}                

struct MeetingRoomMember {
    let profileImage: Int // server: profileImg
    let isHost: Bool
    let nickname: String
}

let dummyMeetingRoomMemberData: MeetingRoomMemberData = MeetingRoomMemberData(
    maxPeopleCount: 7,
    currentPeopleCount: 6,
    members: [
        MeetingRoomMember(
            profileImage: 1,
            isHost: true,
            nickname: "희은이"
        ),
        MeetingRoomMember(
            profileImage: 2,
            isHost: false,
            nickname: "파이리"
        ),
        MeetingRoomMember(
            profileImage: 3,
            isHost: false,
            nickname: "훈발놈"
        ),
        MeetingRoomMember(
            profileImage: 4,
            isHost: false,
            nickname: "노는게젤조아"
        ),
        MeetingRoomMember(
            profileImage: 4,
            isHost: false,
            nickname: "응애기"
        ),
        MeetingRoomMember(
            profileImage: 4,
            isHost: false,
            nickname: "퇴사핑"
        )]
)
