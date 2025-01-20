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
    @Binding var meetingStatus: String
    var onTapRefreshButton: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            meetingStatus == "CLOSED" ? commentDisabledView() : nil
            
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
    
    func commentDisabledView() -> some View {
        Text("해당 모임이 종료되어 더 이상 댓글을 작성할 수 없습니다.")
            .pretendardFont(.body2_m_14)
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.errorRed)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(.subOrange)
            )
            .padding(.top, 16)
            .padding(.horizontal, 16)
    }
}

#Preview {
    MeetingDetailView(
        meetingDetailData: dummymeetingDetailData,
        commentData: dummyCommentData,
        ownerInfoData: dummyOwnerInfoData
    )
}
