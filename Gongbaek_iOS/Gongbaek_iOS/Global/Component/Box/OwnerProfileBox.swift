//
//  OwnerProfileBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct OwnerProfileBox: View {
    @ObservedObject var viewModel: MeetingDetailViewModel
    
    var body: some View {
        if let ownerInfoData = viewModel.ownerInfoData {
            HStack(spacing: 12) {
                if let image = ProfileDefaultImageMap.init(rawValue: (ownerInfoData.profileImg))?.image {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                }
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 4) {
                        Text(ownerInfoData.nickname)
                            .pretendardFont(.body1_b_16)
                            .foregroundStyle(.grayBlack)
                        
                        Image(SexState(ownerInfoData.sex) == .MAN ? .icMale20 : .icFemale20)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray06)
                        Spacer()
                    }
                    
                    MajorChip(major: ownerInfoData.schoolMajor, targetObject: .ownerProfile)
                    
                    HStack(spacing: 6) {
                        ProfileDetailChip(detailCategory: "학번")
                        Text("\((ownerInfoData.enterYear)%100)학번")
                            .foregroundStyle(.gray08)
                            .pretendardFont(.caption2_m_12)
                            .padding(.trailing, 6)
                        ProfileDetailChip(detailCategory: "MBTI")
                        Text(ownerInfoData.mbti)
                            .foregroundStyle(.gray08)
                            .pretendardFont(.caption2_m_12)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray01)
            )
        }
    }
}
