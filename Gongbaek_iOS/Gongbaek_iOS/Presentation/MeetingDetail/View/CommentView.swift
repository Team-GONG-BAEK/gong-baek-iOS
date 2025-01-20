//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    @Binding var commentData: CommentData
    
    var body: some View {
        VStack {
            CommentList(
                commentCount: $commentData.commentCount,
                comments: $commentData.comments,
                isScolled: true,
                meetingStatus: $commentData.groupStatus,
                onTapRefreshButton: nil
            )
            
            CommentTextField()
        }
    }
}
