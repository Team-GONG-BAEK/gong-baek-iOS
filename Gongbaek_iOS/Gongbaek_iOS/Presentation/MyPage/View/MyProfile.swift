//
//  MyProfile.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/25/25.
//

import SwiftUI

struct MyProfile: View {
    var profile: GetMyProfileResponseDTO?
    
    var body: some View {
        HStack(spacing: 14) {
            let imageIndex = profile?.profileImg  ?? 0
            let profileImage = ProfileDefaultImageMap(rawValue: imageIndex - 1)?.image ?? .imgProfileDefault0
            
            Image(profileImage)
                .resizable()
                .frame(width: 64, height: 64)
                .padding(8)
                .border(.gray02, width: 1)
                .cornerRadius(2)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(profile?.nickname ?? "이름 없음")
                    .pretendardFont(.title1_m_20)
                    .foregroundColor(.grayBlack)
                Text("\(profile?.schoolName ?? "학교 정보 없음") | \(profile?.majorName ?? "학과 정보 없음")")
                    .pretendardFont(.body2_r_14)
                    .foregroundColor(.gray08)
            }
            Spacer()
        }
        .padding(16)
    }
}
