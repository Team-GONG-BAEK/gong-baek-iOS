//
//  CommentList.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/20/25.
//

import SwiftUI

struct CommentList: View {
    var meetingRoomViewModel: MeetingRoomViewModel? = nil
    var meetingDetailViewModel: MeetingDetailViewModel? = nil
    var commentCount: Int
    var comments: [Comment]
    let isScrolled: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            headerCommentCell()
            
            if commentCount == 0 {
                commentEmptyView()
                    .frame(minHeight: UIScreen.main.bounds.height * 0.4) // 앱잼을 위해 막 짠 코드..
            } else {
                ScrollView {
                    VStack(alignment:.leading, spacing: 0) {
                        ForEach (comments.indices, id: \.self) { index in
                            CommentCell(comment: comments[index])
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollDisabled(!isScrolled)
            }
        }
        .background(.grayWhite)
    }
    
    func headerCommentCell() -> some View {
        HStack(alignment: .center) {
            Text("댓글 \(commentCount)개")
                .pretendardFont(.body1_sb_16)
                .frame(alignment: .leading)
                .padding(.vertical, 16)
            Spacer()
            Button(
                action: {
                    meetingDetailViewModel?.getComments(
                        groupId: meetingDetailViewModel?.meetingDetailData?.groupId ?? 0,
                        groupType: meetingDetailViewModel?.meetingDetailData?.groupType ?? ""
                    ) { _ in
                        print("새로고쳤지롱! ㅋㅋ")
                    }
                    meetingRoomViewModel?.getComments(
                        groupId: meetingRoomViewModel?.meetingDetailData?.groupId ?? 0,
                        groupType: meetingRoomViewModel?.meetingDetailData?.groupType ?? ""
                    ) { _ in
                        print("새로고쳤지롱! ㅋㅋ")
                    }
            }) {
                Image(.icRefresh32)
                    .foregroundStyle(.gray05)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity)
    }
    
    func commentEmptyView() -> some View {
        Text("아직 댓글이 없어요!\n궁금한 것을 댓글로 작성해주세요.")
            .pretendardFont(.caption1_m_13)
            .multilineTextAlignment(.center)
            .foregroundStyle(.gray06)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(.grayWhite)
    }
}
