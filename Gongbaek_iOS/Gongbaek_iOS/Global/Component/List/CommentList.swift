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
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Text("댓글 \(commentCount)개")
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
                    ForEach (comments.indices, id: \.self) { index in
                        CommentCell(comment: comments[index])
                    }
                }
                .padding(.bottom, 70)
                .padding(.horizontal, 16)
                .background(.grayWhite)
            }
            .scrollDisabled(!isScolled)
        }
    }
}
