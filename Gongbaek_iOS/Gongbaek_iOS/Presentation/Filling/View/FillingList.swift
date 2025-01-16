//
//  FillingList.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/17/25.
//

import SwiftUI

struct FillingList: View {
    let meetings: [Meeting] = dummyMeetings

    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: 0) {
                ForEach(meetings, id: \.groupTitle) { meeting in
                    MeetingInfoCell(meeting: meeting, state: .fill)
                }
            }
        }
    }
}


#Preview {
    FillingList()
}
