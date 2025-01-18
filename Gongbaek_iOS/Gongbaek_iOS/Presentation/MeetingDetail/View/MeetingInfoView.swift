//
//  MeetingInfoView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingInfoView: View {
    let ownerInfo: OwnerInfoData
    //    @Binding var meetingDetail: MeetingDetailData
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("소개글")
                        .pretendardFont(.body1_b_16)
                    Text("meetingDetail.introduction")
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
                    
                    OwnerProfileBox(
                        ownerData: .init(
                            profileImage: ownerInfo.profileImg,
                            nickname: ownerInfo.nickname,
                            sex: ownerInfo.sex,
                            schoolMajor: ownerInfo.schoolMajor,
                            enterYear: ownerInfo.enterYear,
                            schoolGrade: ownerInfo.schoolGrade,
                            mbti: ownerInfo.mbti
                        )
                    )
                    
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

#Preview {
    MeetingDetailView(
        meetingDetail: .init(
            groupId: 1,
            groupType: "WEEKLY",
            groupTitle: "공강팅",
            location: "학교 정문",
            status: "RECRUITING",
            isHost: true,
            isApply: true,
            currentPeopleCount: 4,
            maxPeopleCount: 6,
            introduction: "복학하고 친구가 없어요 ㅠㅠ 밥 먹을 사람?",
            category: "STUDY",
            coverImg: 1,
            weekDay: "MON",
            weekDate: nil,
            startTime: 10.5,
            endTime: 12
        )
    )
}

#Preview {
    MeetingInfoView(ownerInfo: .init(
        profileImg: 1,
        nickname: "나공일히은",
        sex: "FEMALE",
        schoolMajor: "미디어기술콘텐츠학과",
        enterYear: 2020,
        schoolGrade: 4,
        mbti: "INTJ",
        introduction: "하이 나 공일 히은 ㅋㅋ 나랑 놀 사람? 나 칭구 없어 ㅠ"
    ))
}
