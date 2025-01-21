//
//  MeetingInfoView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingInfoView: View {
    @Binding var ownerInfo: OwnerInfoModel
    @Binding var introduction: String
    @Binding var currentPeopleCount: Int
    @Binding var maxPeopleCount: Int
    @Binding var meetingStatus: String
    @State private var selectedIndex = 0
    
    
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
                    
                    OwnerProfileBox(ownerData: .constant(OwnerProfileData(
                        profileImage: ownerInfo.profileImg,
                        nickname: ownerInfo.nickname,
                        sex: ownerInfo.sex,
                        schoolMajor: ownerInfo.schoolMajor,
                        enterYear: ownerInfo.enterYear,
                        schoolGrade: ownerInfo.schoolGrade,
                        mbti: ownerInfo.mbti
                    )))
                    
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
            
            // ButtonTextLogic처리 필요
            
            // isHost == true >>> buttonText = "삭제하기" // onTap = nil
            // isHost == false >>> isApply == false >>> buttonText = "신청하기" // onTap = "isApply = true"
            // isHost == false >>> isApply == true >>> buttonText = "취소하기" // onTap = "isApply = false"
            
            ApplyBar(
                applyData: .init(
                    isActivated: true, // closed일 때만 false <<< meetingStatus
                    currentPeopleCount: currentPeopleCount,
                    maxPeopleCount: maxPeopleCount,
                    buttonText: "신청하기", // buttonText 변환 로직 필요 <<< meetingStatus
                    onTap: nil
                )
            )
        }
    }
}
