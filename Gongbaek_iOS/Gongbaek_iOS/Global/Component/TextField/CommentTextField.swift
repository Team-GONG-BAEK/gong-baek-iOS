//
//  CommentTextField.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CommentTextField: View {
    var viewModel: any CommentManageable
    @State private var comment: String = ""
    @State private var textFieldHeight: CGFloat = 48
    @State var sendButtonTapped: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            TextField(
                "댓글을 작성해주세요.",
                text: $comment,
                axis: .vertical
            )
            .pretendardFont(.body1_m_16)
            .background(.gray01)
            .foregroundColor(.gray10)
            .lineLimit(1...3)
            .padding(.vertical, 14)
            .padding(.leading, 12)
            
            Button(
                action: {
                    guard let data = viewModel.commentData else { return }
                    viewModel.postComment(
                        groupId: data.groupId,
                        groupType: data.groupType,
                        commentContent: comment
                    )
                
                    hideKeyboard()
                    comment = ""
            }) {
                Image(.icSend24)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .disabled(comment.isEmpty || isWhiteSpaceText(comment))
            .padding(.bottom, 12)
            .padding(.trailing, 12)
            .foregroundStyle(.mainOrange)
            .frame(alignment: .bottomTrailing)
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.gray01)
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
    
    func isWhiteSpaceText(_ text: String) -> Bool {
        return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
