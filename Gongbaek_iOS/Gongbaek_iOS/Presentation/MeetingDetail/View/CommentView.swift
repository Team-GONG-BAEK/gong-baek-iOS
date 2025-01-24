//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

import Combine

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
            
            RecruitingState(viewModel.commentData?.groupStatus) == .CLOSED
            ? nil
            : CommentTextField(meetingDetailViewModel: viewModel)
                .padding(0)
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
}

