//
//  CommentCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CommentCell: View {
    let comment: Comment
    let viewModel: any CommentManageable
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 6) {
                    Text(comment.nickname ?? "알 수 없음")
                        .pretendardFont(.body1_sb_16)
                        .foregroundColor(.gray10)
                    comment.isGroupHost ? OwnerChip() : nil
                    
                    Spacer()
                    
                    if comment.isWriter {
                        DeleteButton {
                            deleteComment(commentId: comment.commentId)
                        }
                    } else {
                        reportButton()
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
    
    private func reportButton() -> some View {
        Button(action: {
            viewModel.handleReportAction(commentId: comment.commentId)
        }) {
            Image(.icReport20)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
    
    private func divider() -> some View {
        Color.gray02.frame(height: 1)
    }
    
    private func deleteComment(commentId: Int) {
        if let data = viewModel.commentData {
            viewModel.deleteComment(
                groupId: data.groupId,
                groupType: data.groupType,
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
