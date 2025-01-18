//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    let commentData: CommentData
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text("댓글 \(commentData.commentCount)개")
                        .pretendardFont(.body1_sb_16)
                        .frame(alignment: .leading)
                        .padding(.vertical, 16)
                    Spacer()
                    Button(action: {}) {
                        Image(.icRefresh32)
                            .foregroundStyle(.gray05)
                    }
                }
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .frame(maxWidth: .infinity)
                .background(.grayWhite)
                
                ScrollView {
                    VStack(alignment:.leading, spacing: 0) {
                        ForEach (commentData.comments.indices, id: \.self) { index in
                            CommentCell(comment: commentData.comments[index])
                        }
                    }
                    .padding(.horizontal, 16)
                    .background(.grayWhite)
                }
                CommentTextField()
            }
        }
    }
}

#Preview {
    MeetingDetailView(meetingDetail: dummymeetingDetailData)
}

#Preview {
    CommentView(commentData: dummyCommentData)
}
