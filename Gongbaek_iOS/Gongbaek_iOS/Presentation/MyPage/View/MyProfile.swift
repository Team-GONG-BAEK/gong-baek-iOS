//
//  MyProfile.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/25/25.
//

import SwiftUI

struct MyProfile: View {
    var profile: GetMyProfileResponseDTO
    
    var body: some View {
        HStack(spacing: 14) {
            let imageIndex = profile.profileImg
            let profileImage = ProfileDefaultImageMap(rawValue: imageIndex)?.image ?? .imgProfileDefault0
            
            Image(profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .padding(8)
                .border(.gray02, width: 1)
                .cornerRadius(2)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(profile.nickname)
                    .pretendardFont(.title1_m_20)
                    .foregroundColor(.grayBlack)
                Text("\(profile.schoolName) | \(profile.majorName)")
                    .pretendardFont(.body2_r_14)
                    .foregroundColor(.gray08)
            }
            Spacer()
        }
        .padding(16)
    }
}
