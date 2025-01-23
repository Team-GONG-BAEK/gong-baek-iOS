//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    @ObservedObject var viewModel: MeetingDetailViewModel
    
    var body: some View {
        VStack {
//            RecruitingState(viewModel.commentData?.status) == .CLOSED ? CommentDisabledBox() : nil
//            
//            CommentList(
//                viewModel: MeetingRoomViewModel(),
//                commentCount: viewModel.commentData?.commentCount ?? 0,
//                comments: viewModel.commentData?.comments ?? [],
//                isScrolled: true,
//                onTapRefreshButton: nil
//            )
//            
//            RecruitingState(viewModel.commentData?.groupStatus) == .CLOSED ? nil : CommentTextField(viewModel: MeetingRoomViewModel())
        }
    }
}
//
//#Preview {
//    MeetingDetailView(
//        meetingDetailData: dummymeetingDetailData,
//        ownerInfoData: dummyOwnerInfoData,
//        commentData: dummyCommentData
//    )
//}
