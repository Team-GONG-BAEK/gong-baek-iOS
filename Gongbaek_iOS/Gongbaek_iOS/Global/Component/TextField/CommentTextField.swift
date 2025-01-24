//
//  CommentTextField.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CommentTextField: View {
    var meetingRoomViewModel: MeetingRoomViewModel? = nil
    var meetingDetailViewModel: MeetingDetailViewModel? = nil
    @State private var comment: String = ""
    @State private var textFieldHeight: CGFloat = 48
    @State var sendButtonTapped: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            TextField(
                "댓글을 작성해주세요.",
                text: $comment,
                axis: .vertical
            )
            .pretendardFont(.body1_m_16)
            .background(.gray01)
            .foregroundColor(.gray10)
            .lineLimit(1...3)
            .padding(.vertical, 14)
            .padding(.leading, 12)
            
            Button(
                action: {
                    meetingRoomViewModel?.postComment(
                        groupId: meetingRoomViewModel?.meetingDetailData?.groupId ?? 0,
                        groupType: meetingRoomViewModel?.meetingDetailData?.groupType ?? "",
                        commentContent: comment
                    )
                    
                    meetingDetailViewModel?.postComment(
                        groupId: meetingDetailViewModel?.meetingDetailData?.groupId ?? 0,
                        groupType: meetingDetailViewModel?.meetingDetailData?.groupType ?? "",
                        commentContent: comment
                    )
                
                    hideKeyboard()
                    comment = ""
            }) {
                Image(.icSend24)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .disabled(comment.isEmpty)
            .padding(.bottom, 12)
            .padding(.trailing, 12)
            .foregroundStyle(.mainOrange)
            .frame(alignment: .bottomTrailing)
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.gray01)
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}
