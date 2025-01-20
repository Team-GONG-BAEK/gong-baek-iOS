//
//  CommentList.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/20/25.
//

import SwiftUI

struct CommentList: View {
    @Binding var commentCount: Int
    @Binding var comments: [Comment]
    let isScolled: Bool
    var onTapRefreshButton: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            headerCommentCell()
            
            ScrollView {
                VStack(alignment:.leading, spacing: 0) {
                    ForEach (comments.indices, id: \.self) { index in
                        CommentCell(comment: comments[index])
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollDisabled(!isScolled)
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
            Button(action: {
                onTapRefreshButton?()
            }) {
                Image(.icRefresh32)
                    .foregroundStyle(.gray05)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MeetingDetailView(
        meetingDetailData: dummymeetingDetailData,
        ownerInfoData: dummyOwnerInfoData,
        commentData: dummyCommentData
    )
}
