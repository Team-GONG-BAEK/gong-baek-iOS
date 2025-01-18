//
//  MyRecruit.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyFillingList: View {
    let meetings: [Meeting] = dummyMeetings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 4) {
                    Image(.icFire18)
                        .renderingMode(.original)
                        .frame(width: 18, height: 18)
                    Text("현재 활동중인 모임")
                        .font(.pretendard(.title2_sb_18))
                }
                .padding(.top, 28)
                .padding(.horizontal, 16)
               
                ForEach(meetings, id: \.groupTitle) { meeting in
                    MeetingInfoCell(meeting: meeting, state: .myFill)
                }
                .padding(.top, 6)
                
                HStack(spacing: 4) {
                    Image(.icLock18)
                        .renderingMode(.original)
                        .frame(width: 18, height: 18)
                    Text("종료된 모임")
                        .font(.pretendard(.title2_sb_18))
                }
                .padding(.top, 28)
                .padding(.horizontal, 16)
               
                ForEach(meetings, id: \.groupTitle) { meeting in
                    MeetingInfoCell(meeting: meeting, state: .myFill)
                }
                
            }
        }
    }
}

#Preview {
    MyFillingList()
}
