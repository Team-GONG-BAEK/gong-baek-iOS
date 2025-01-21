//
//  OwnerProfileBox.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

//TODO: Model로 분리

struct OwnerProfileData {
    var profileImage: Int
    var nickname: String
    var sex: String
    var schoolMajor: String
    var enterYear: Int
    var schoolGrade: Int
    var mbti: String
}

struct OwnerProfileBox: View {
    @Binding var ownerData: OwnerProfileData
    
    var body: some View {
        HStack(spacing: 12) {
            Image(" ") // MARK: - TODO: 이미지 네이밍 수정
                .resizable()
                .frame(width: 80, height: 80)
                .background(.gray04) // MARK: - TODO: 이미지 삽입 시 삭제
                .foregroundStyle(.mainOrange) // MARK: - TODO: 이미지 삽입 시 삭제
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text(ownerData.nickname)
                        .pretendardFont(.body1_b_16)
                        .foregroundStyle(.grayBlack)
                    
                    Image(ownerData.sex == "MAN" ? .icMale20 : .icFemale20)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray06)
                    Spacer()
                }
                
                MajorChip(major: ownerData.schoolMajor, targetObject: .ownerProfile)
                
                HStack(spacing: 6) {
                    ProfileDetailChip(detailCategory: "학번/학년")
                    Text("\(ownerData.enterYear%100)학번 \(ownerData.schoolGrade)학년")
                        .foregroundStyle(.gray08)
                        .pretendardFont(.caption2_m_12)
                        .padding(.trailing, 6)
                    ProfileDetailChip(detailCategory: "MBTI")
                    Text(ownerData.mbti)
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
