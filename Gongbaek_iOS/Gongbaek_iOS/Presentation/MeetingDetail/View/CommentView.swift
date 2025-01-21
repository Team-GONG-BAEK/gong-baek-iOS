//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    @Binding var commentData: CommentModel
    
    var body: some View {
        VStack {
            RecruitingState(from: commentData.groupStatus) == .CLOSED ? CommentDisabledBox() : nil
            
            CommentList(
                commentCount: $commentData.commentCount,
                comments: $commentData.comments,
                isScolled: true,
                onTapRefreshButton: nil
            )
            
            RecruitingState(from: commentData.groupStatus) == .CLOSED ? nil : CommentTextField()
        }
    }
}

#Preview {
    MeetingDetailView(
        meetingDetailData: dummymeetingDetailData,
        ownerInfoData: dummyOwnerInfoData,
        commentData: dummyCommentData
    )
}
