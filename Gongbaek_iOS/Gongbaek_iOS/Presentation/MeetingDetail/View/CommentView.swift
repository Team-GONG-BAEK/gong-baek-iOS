//
//  CommentView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct CommentView: View {
    let items: [String] = ["1", "2", "3", "4"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text("댓글 \(items.count)개")
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
                        ForEach (items.indices) { item in
                            CommentCell(
                                comment: .init(
                                    isOwner: true,
                                    isWriter: false,
                                    nickmane: "히니",
                                    content: "콘텐츠가먼데요 ㅋㅋ 아아아.",
                                    date: "12/24/12:42"
                                )
                            )
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
    CommentView()
}

#Preview {
    MeetingDetailView()
}
