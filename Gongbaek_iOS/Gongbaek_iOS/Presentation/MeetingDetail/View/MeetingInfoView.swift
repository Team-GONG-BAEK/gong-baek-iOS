//
//  MeetingInfoView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingInfoView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("소개글")
                        .pretendardFont(.body1_b_16)
                    Text("소개글예시")
                        .pretendardFont(.body2_r_14)
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                    Text("모집자 프로필")
                        .pretendardFont(.body1_b_16)
                    
                    OwnerProfileBox(
                        ownerData: .init(
                            profileImage: 1,
                            nickname: "희은이얌",
                            sex: "FEMALE",
                            schoolMajor: "미디어기술콘텐츠학과",
                            enterYear: 2020,
                            schoolGrade: 4,
                            mbti: "INTJ"
                        )
                    )
                    
                    Text("Owner 소개글")
                        .pretendardFont(.body2_r_14)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
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

#Preview {
    MeetingDetailView()
}
