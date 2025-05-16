//
//  CommentCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CommentCell: View {
    let comment: Comment
    var meetingDetailViewModel: MeetingDetailViewModel?
    var meetingRoomViewModel: MeetingRoomViewModel?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 6) {
                    Text(comment.nickname ?? "알 수 없음")
                        .pretendardFont(.body1_sb_16)
                    comment.isGroupHost ? OwnerChip() : nil
                    Spacer()
                    if comment.isWriter {
                        DeleteButton {
                            deleteComment(commentId: comment.commentId)
                        }
                    }
                }
                .foregroundColor(.grayBlack)
                .padding(.bottom, 8)
                
                Text(comment.body)
                    .pretendardFont(.body2_r_14)
                    .foregroundColor(.gray08)
                    .padding(.bottom, 4)
                
                Text(Date.formattedCommentDateTime(comment.createdAt))
                    .pretendardFont(.caption2_r_12)
                    .foregroundColor(.gray05)
            }
            .padding(.vertical, 14)
            
            divider()
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 1)
    }
    
    private func deleteComment(commentId: Int) {
        if let viewModel = meetingDetailViewModel,
           let data = viewModel.meetingDetailData {
            viewModel.deleteComment(
                groupId: data.groupId,
                groupType: data.groupType,
                commentId: commentId
            )
        } else if let viewModel = meetingRoomViewModel {
            viewModel.deleteComment(
                groupId: viewModel.meetingDetailData?.groupId ?? 0,
                groupType: viewModel.meetingDetailData?.groupType ?? "",
                commentId: commentId
            )
        }
    }
}

struct DeleteButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(.icCommentX20)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray05)
        }
    }
}
