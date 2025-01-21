//
//  HomeMatchMemberListCell.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct HomeMatchMemberListCell: View {
    
    var body: some View {
        VStack(spacing: 9) {
            HStack {
                HStack(spacing: 10) {
                    Image(.profileImage5)
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                    
                    memberProfile()
                }
                
                Spacer()
                chatButton()
            }
            divider()
        }
    }
    
    private func memberProfile() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                Text("연유커피")
                    .pretendardFont(.body2_sb_14)
                    .foregroundStyle(.gray09)
                
                Image(.icFemale20)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            
            MajorChip(
                major: "컴퓨터예술학부",
                targetObject: .suggestedUserProfile
            )
        }
    }
    
    private func chatButton() -> some View {
        Button {
            // TODO: 추후 스프린트 구현 예정
        } label: {
            Text("채팅하기")
                .pretendardFont(.caption2_b_12)
                .foregroundStyle(.grayWhite)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .background(.mainOrange)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
    
    private func divider() -> some View {
        Rectangle()
            .fill(.gray02)
            .frame(width: .infinity, height: 1)
    }
}

#Preview {
    HomeMatchMemberListCell()
}
