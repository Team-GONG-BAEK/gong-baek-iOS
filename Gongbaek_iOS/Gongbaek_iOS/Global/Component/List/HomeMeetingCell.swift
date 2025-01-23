//
//  HomeMeetingCell.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct HomeMeetingCell: View {
    let data: JoinableMeetingModel
    let groupType: GroupState
    
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
                userProfile()
            }
        }
        .frame(width: groupType == .WEEKLY ? 116 : 160)
    }
    
    @ViewBuilder
    private func meetingImage() -> some View {
        if let coverImage = CategoryState(data.category)?.coverImage[data.coverImg - 1] {
            Image(coverImage)
                .resizable()
                .scaledToFill()
                .frame(
                    width: groupType == .WEEKLY ? 116 : 160,
                    height: groupType == .WEEKLY ? 108 : 104
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 4)
                )
        } else {
            Rectangle()
                .fill(.gray03)
                .frame(
                    width: groupType == .WEEKLY ? 116 : 160,
                    height: groupType == .WEEKLY ? 108 : 104
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 4)
                )
        }
    }
    
    private func categoryChip() -> some View {
        Text(CategoryState(data.category)?.categoryName ?? "")
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
            
            Text(formattedTime(groupType: groupType))
            .pretendardFont(.caption2_m_12)
            .foregroundStyle(.gray06)
            .lineLimit(1)
            
            Spacer()
        }
    }
    
    private func userProfile() -> some View {
        HStack(spacing: 2) {
            if let image = ProfileDefaultImageMap(rawValue: data.profileImg - 1)?.image {
                Image(image)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            } else {
                Rectangle()
                    .fill(.gray03)
                    .frame(width: 16, height: 16)
            }
            
            Text(data.nickname)
                .pretendardFont(.caption2_r_12)
                .foregroundStyle(.gray09)
                .lineLimit(1)
            
            Spacer()
        }
    }
}

extension HomeMeetingCell {
    
    private func formattedTime(groupType: GroupState) -> String {
        let time = (WeekDay(data.weekDay)?.koreanName ?? "") + " " +
        "\(Date.formatTime(data.startTime))-\(Date.formatTime(data.endTime))"
        
        if groupType == .ONCE {
            let date = Date.formatDate(data.weekDate ?? "")
            return "\(date) \(time)"
        } else {
            return time
        }
    }
}

#Preview {
    HomeMeetingCell(
        data: JoinableMeetingModel(
            groupId: 0,
            category: "DINING",
            coverImg: 4,
            profileImg: 2,
            nickname: "아요옹",
            groupType: "WEEKLY",
            groupTitle: "같이 저녁 먹을 사람들 구합니다",
            weekDay: "FRI",
            weekDate: "2025-05-15",
            startTime: 17.0,
            endTime: 18.0,
            location: "학교 정문 앞"
        ),
        groupType: .WEEKLY
    )
}
