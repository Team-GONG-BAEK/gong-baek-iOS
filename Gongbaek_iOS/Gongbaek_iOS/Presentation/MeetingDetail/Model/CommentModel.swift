//
//  CommentModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct CommentData {
    var commentCount: Int
    let groupId: Int
    let groupType: String
    let groupStatus: String
    var comments: [Comment]
}

let dummyCommentData: CommentData = CommentData(
    commentCount: 3,
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
            nickname: "로이임탄",
            body: "우리는 강남에서 활동해요!",
            createdAt: "12/27 19:21"
        ),
        Comment(
            isGroupHost: false,
            isWriter: false,
            nickname: "훈발놈",
            body: "어떤 방식으로 진행되는지 궁금합니다!",
            createdAt: "12/27 19:22"
        ),
        Comment(
            isGroupHost: false,
            isWriter: true,
            nickname: "아기응애",
            body: "난 안궁금 ! ㅋㅋ",
            createdAt: "12/28 19:22"
        )
    ]
)
