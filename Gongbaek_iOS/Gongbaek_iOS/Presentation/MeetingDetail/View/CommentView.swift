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
            RecruitingState(viewModel.commentData?.groupStatus) == .CLOSED ? CommentDisabledBox() : nil
            
            CommentList(
                meetingDetailViewModel: viewModel,
                commentCount: viewModel.commentData?.commentCount ?? 0,
                comments: viewModel.commentData?.comments ?? [],
                isScrolled: true
            )
            
            RecruitingState(viewModel.commentData?.groupStatus) == .CLOSED ? nil : CommentTextField(meetingDetailViewModel: viewModel)
        }
    }
}
