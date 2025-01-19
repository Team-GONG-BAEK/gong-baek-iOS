//
//  MeetingRoomView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

struct MeetingRoomView: View {
    @State var commentData: MeetingRoomCommentData
    let items = ["HEEEUN", "MS", "NY"]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    MeetingChip(state: .recruiting(.closed))
                    MeetingChip(state: .category(.DINING))
                    MeetingChip(state: .weekly(true))
                }
                .padding(.top, 18)
                .padding(.bottom, 6)
                
                Text("화석의 튜스데이 점심클럽")
                    .pretendardFont(.title1_b_20)
                    .foregroundColor(.grayWhite)
                    .lineLimit(nil)
                    .padding(.bottom, 12)
                
                TimeBox(state: .white, text: "매주 목요일 13시 30분 - 15시 30분", font: .pretendard(.caption2_r_12))
                    .padding(.bottom, 2)
                
                LocationBox(state: .white, text: "학교 피아노 앞", font: .pretendard(.caption2_r_12))
            }
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Image("sample")
                    .resizable()
                    .scaledToFill()
            )
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(.icPeople18)
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.gray06)
                    Text("멤버 (5/6명)")
                        .pretendardFont(.title2_sb_18)
                        .foregroundStyle(.gray10)
                }
                .padding(.top, 16)
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.grayWhite)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(items.indices, id: \.self) { index in
                        MemberProfileBox(profileImage: "1", nickname: items[index], isOwner: true)
                    }
                }
                .padding(.horizontal, 9)
                .padding(.bottom, 16)
            }
            .background(.grayWhite)
            Color.gray02.frame(height: 8)
            
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text("댓글 10개")
                            .pretendardFont(.body1_sb_16)
                            .frame(alignment: .leading)
                            .padding(.vertical, 16)
                        Spacer()
                        Button(action: {}) {
                            Image(.icRefresh32)
                                .foregroundStyle(.gray05)
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                    
                    ScrollView {
                        VStack(alignment:.leading, spacing: 0) {
                            ForEach (commentData.comments.indices, id: \.self) { index in
                                CommentCell(comment: commentData.comments[index])
                            }
                        }
                        .padding(.horizontal, 16)
                        .background(.grayWhite)
                    }
                    CommentTextField()
                }
            }
        }
    }
}

#Preview {
    MeetingRoomView(commentData: dummyMeetingRoomCommentData)
}
