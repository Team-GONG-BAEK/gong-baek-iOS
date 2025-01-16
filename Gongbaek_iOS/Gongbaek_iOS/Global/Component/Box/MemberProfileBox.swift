//
//  MemberProfileBlock.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct MemberProfileBox: View {
    var profileImage: String //TODO: 추후 Int값으로 바꿔야함 - 고정값임.
    var nickname: String
    var isOwner: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            Image(profileImage) // MARK: - TODO: 이미지 네이밍 수정
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFill()
                .background(.gray04) // MARK: - TODO: 이미지 삽입 시 삭제
                .foregroundStyle(.mainOrange) // MARK: - TODO: 이미지 삽입 시 삭제
                .overlay(
                    isOwner ? OwnerChip().padding(6) : nil,
                    alignment: .bottomLeading
                )
                .padding(.horizontal, 7)
            
            Text(nickname)
                .pretendardFont(.caption1_m_13)
                .foregroundStyle(.gray10)
        }
        .background(Color.red)
    }
}

#Preview {
    MemberProfileBox(profileImage: "sample", nickname: "희은이입니다람쥐깡깡", isOwner: true)
}
