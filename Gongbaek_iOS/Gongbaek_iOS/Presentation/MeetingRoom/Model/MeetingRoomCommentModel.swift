//
//  MeetingRoomCommentModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

 let dummyMeetingRoomCommentData: CommentModel = CommentModel(
     commentCount: 10,
     groupId: 1,
     groupType: "ONCE",
     groupStatus: "CLOSED",
     comments: [
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "파이리",
             body: "정확히 어디서 활동하는 건가요?",
             createdAt: "12/27 19:20"
         ),
        Comment(
             isGroupHost: true,
             isWriter: false,
             nickname: "희은이",
             body: "우리는 판교에서 활동하장 ㅋ !",
             createdAt: "12/27 19:21"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "현민",
             body: "어떤 방식으로 진행되는지 궁금합니다!",
             createdAt: "12/27 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: true,
             nickname: "아기응애",
             body: "난 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "민서02",
             body: "ㄴ난 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "희은",
             body: "난 완전 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "나연",
             body: "난 궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "민서",
             body: "ㄴ난 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "효준",
             body: "ㄴㄴ난 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         ),
        Comment(
             isGroupHost: false,
             isWriter: false,
             nickname: "현진",
             body: "ㄴㄴㄴ난 안궁금 ! ㅋㅋ",
             createdAt: "12/28 19:22"
         )
     ]
 )
