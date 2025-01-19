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
            Image(profileImage) //TODO: 이미지 네이밍 수정
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .overlay(
                    isOwner ? OwnerChip(ownerChipType: .gray09).padding(6) : nil,
                    alignment: .bottomLeading
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.gray02, lineWidth: 1)
                )
                .padding(.horizontal, 7)
 
            Text(nickname)
                .pretendardFont(.caption1_m_13)
                .foregroundStyle(.gray10)
        }
        .background(.grayWhite)
    }
}

#Preview {
    MemberProfileBox(profileImage: "sample", nickname: "희은이입니다람쥐깡깡", isOwner: true)
}
