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
            let profileImage = ProfileDefaultImageMap(rawValue: profile.profileImg)?.image
            
            if let profileImage {
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
            }
            
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
