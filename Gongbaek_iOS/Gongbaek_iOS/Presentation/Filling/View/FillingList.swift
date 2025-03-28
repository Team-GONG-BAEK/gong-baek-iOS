//
//  FillingList.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/17/25.
//

import SwiftUI

struct FillingList: View {
    @ObservedObject var viewModel = FillingViewModel()
    
    let meetings: [Meeting]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                if meetings.isEmpty {
                    FillingEmptyView()
                } else {
                    VStack(alignment:.leading, spacing: 0) {
                        ForEach(meetings, id: \..groupTitle) { meeting in
                            MeetingInfoCell(meeting: meeting, state: .fill)
                        }
                    }
                }
            }
        }
    }
}
