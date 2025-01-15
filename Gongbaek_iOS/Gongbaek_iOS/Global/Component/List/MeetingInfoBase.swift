//
//  MeetingInfoBasic.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct Meeting {
    let status: String
    let category: String
    let coverImg: String
    let groupType: String
    let groupTitle: String
    let weekDay: WeekFullDay?
    let weekDate: String?
    let startTime: Double
    let endTime: Double
    let location: String
}

struct MeetingInfoBase: View {
    let state: MeetingInfoState
    let meeting: Meeting
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                Image(meeting.coverImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 102, height: 102)
                    .cornerRadius(2)
                
                VStack(alignment: .leading, spacing: 6) {
                    // 모임 태그
                    HStack(spacing: 5) {
                        MeetingChip(state: .recruiting(.recruiting))
                        MeetingChip(state: .category(.sport))
                        MeetingChip(state: .weekly(true))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // 모임 제목
                        Text(meeting.groupTitle)
                            .font(state.titleFont)
                            .lineLimit(1)
                        
                        // 모임 정보
                        VStack(alignment: .leading, spacing: 2) {
                            TimeBox(
                                state: .gray,
                                text: formattedDateAndTime(weekDay: meeting.weekDay, weekDate: meeting.weekDate, time: meeting.startTime),
                                font: state.infoFont
                            )
                            LocationBox(state: .gray, text: meeting.location, font: state.infoFont)
                        }
                    }
                }
            }
        }
    }
}


//TODO: 밑에 메서드들은 extension으로 분리

// 날짜와 시간을 포맷팅하는 함수
func formattedDateAndTime(weekDay: WeekFullDay?, weekDate: String?, time: Double) -> String {
    let formattedTime = formatTime(time)
    
    if let weekDay = weekDay {
        return "매주 \(weekDay.displayName) \(formattedTime)"
    } else if let weekDate = weekDate {
        let formattedDate = formatDate(weekDate)
        return "\(formattedDate) \(formattedTime)"
    }
    
    return "시간 정보 없음"
}

// 시간 포맷 함수
func formatTime(_ time: Double) -> String {
    let hours = Int(time)
    let minutes = Int((time - Double(hours)) * 60)
    return minutes == 0 ? "\(hours)시" : "\(hours)시 \(minutes)분"
}

// 날짜 포맷 함수
func formatDate(_ dateString: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let date = formatter.date(from: dateString) else { return dateString }
    
    formatter.dateFormat = "MM월 dd일"
    return formatter.string(from: date)
}

#Preview {
    MeetingInfoBase(
        state: .cell, meeting: Meeting(
            status: "모집 중",
            category: "스터디",
            coverImg: "sample",
            groupType: "WEEKLY",
            groupTitle: "나는 개바보다 나랑 친구하고 싶으면 들어오덩가 ㅋㅋㅋ",
            weekDay: .monday,
            weekDate: nil,
            startTime: 13.0,
            endTime: 15.0,
            location: "학교 정문인데 어쩌구 저쩌구 20자 넘으면"
        )
    )
}
