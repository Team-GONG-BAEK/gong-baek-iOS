//
//  MeetingInfoView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingInfoView: View {
    @Binding var ownerInfo: OwnerInfoData
    @Binding var introduction: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("소개글")
                        .pretendardFont(.body1_b_16)
                    Text(introduction)
                        .pretendardFont(.body2_r_14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                    
                    Text("모집자 프로필")
                        .pretendardFont(.body1_b_16)
                    
                    OwnerProfileBox(ownerData: OwnerProfileData(
                        profileImage: ownerInfo.profileImg,
                        nickname: ownerInfo.nickname,
                        sex: ownerInfo.sex,
                        schoolMajor: ownerInfo.schoolMajor,
                        enterYear: ownerInfo.enterYear,
                        schoolGrade: ownerInfo.schoolGrade,
                        mbti: ownerInfo.mbti
                    ))
                    
                    Text(ownerInfo.introduction)
                        .pretendardFont(.body2_r_14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            ApplyBar(
                apply: .init(
                    isActivated: true,
                    currentPeopleCount: 5,
                    maxPeopleCount: 10,
                    buttonText: "신청하기",
                    onTap: nil
                )
            )
        }
    }
}
