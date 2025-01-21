//
//  CommentDisabledBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/21/25.
//

import SwiftUI

struct CommentDisabledBox: View {
    var body: some View {
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
            .background(.grayWhite)
    }
}
