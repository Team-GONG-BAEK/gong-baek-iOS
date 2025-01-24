//
//  OwnerProfileBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

//TODO: Model로 분리

struct OwnerProfileBox: View {
    @ObservedObject var viewModel: MeetingDetailViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            if let image = ProfileDefaultImageMap.init(rawValue: (viewModel.ownerInfoData?.profileImg ?? 0) - 1)?.image {
                Image(image)
                    .resizable()
                    .padding(8)
                    .background(.grayWhite)
                    .frame(width: 80, height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.gray02, lineWidth: 1)
                    )
            }
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text(viewModel.ownerInfoData?.nickname ?? "")
                        .pretendardFont(.body1_b_16)
                        .foregroundStyle(.grayBlack)
                    
                    Image(SexState(viewModel.ownerInfoData?.sex ?? "") == .MAN ? .icMale20 : .icFemale20)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray06)
                    Spacer()
                }
                
                MajorChip(major: viewModel.ownerInfoData?.schoolMajor ?? "", targetObject: .ownerProfile)
                
                HStack(spacing: 6) {
                    ProfileDetailChip(detailCategory: "학번/학년")
                    Text("\((viewModel.ownerInfoData?.enterYear ?? 0 )%100)학번 \(String(describing: viewModel.ownerInfoData?.schoolGrade ?? 0))학년")
                        .foregroundStyle(.gray08)
                        .pretendardFont(.caption2_m_12)
                        .padding(.trailing, 6)
                    ProfileDetailChip(detailCategory: "MBTI")
                    Text(viewModel.ownerInfoData?.mbti ?? "")
                        .foregroundStyle(.gray08)
                        .pretendardFont(.caption2_m_12)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(.gray01))
    }
}
