//
//  HomeMeetingCell.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct HomeMeetingCell: View {
    let data: MeetingModel
    let isWeekly: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 6) {
                ZStack(alignment: .bottomLeading) {
                    meetingImage()
                    categoryChip()
                        .padding(.leading, 8)
                        .padding(.bottom, 8)
                }
                
                meetingTitle()
            }
            
            VStack(spacing: 2) {
                meetingTime()
                userProfiles()
            }
        }
        .frame(width: isWeekly ? 116 : 160)
    }
    
    private func meetingImage() -> some View {
        Image(.sample)
            .resizable()
            .scaledToFill()
            .frame(
                width: isWeekly ? 116 : 160,
                height: isWeekly ? 108 : 104
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 4)
            )
    }
    
    private func categoryChip() -> some View {
        Text(CategoryState.STUDY.categoryName)
            .pretendardFont(.caption2_r_12)
            .foregroundStyle(.grayWhite)
            .padding(.horizontal, 4)
            .background(.gray09)
            .clipShape(RoundedRectangle(cornerRadius: 2))
    }
    
    private func meetingTitle() -> some View {
        Text(data.groupTitle)
            .pretendardFont(.body2_sb_14)
            .foregroundStyle(.gray10)
            .lineLimit(1)
    }
    
    private func meetingTime() -> some View {
        HStack(spacing: 4) {
            Image(.icTime16)
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(
                isWeekly
                ? data.weekDate + " 14시-16시"
                : (data.groupDate ?? "") + " 수요일 14시 30분-15시"
            )
            .pretendardFont(.caption2_m_12)
            .foregroundStyle(.gray06)
            .lineLimit(1)
            
            Spacer()
        }
    }
    
    private func userProfiles() -> some View {
        HStack(spacing: 2) {
            Image(.profileImage5)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text("난밤새는게힘들다이제")
                .pretendardFont(.caption2_r_12)
                .foregroundStyle(.gray09)
                .lineLimit(1)
            
            Spacer()
        }
    }
}

#Preview {
    HomeMeetingCell(
        data: MeetingModel(
            groupId: 0,
            category: "DINING",
            coverImg: 4,
            profileImg: 2,
            groupType: "WEEKLY",
            groupTitle: "같이 저녁 먹을 사람들 구합니다",
            weekDate: "FRI",
            groupDate: "2025-05-15",
            startTime: 17.0,
            endTime: 18.0,
            location: "학교 정문 앞"
        ),
        isWeekly: false
    )
}
