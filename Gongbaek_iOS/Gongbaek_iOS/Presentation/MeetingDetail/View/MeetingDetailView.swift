//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @StateObject var viewModel = MeetingDetailViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .detail,
                meeting: viewModel.meeting)
            .padding(16)
            
            divider()
            
            MeetingDetailSegmentControlBar(viewModel: viewModel)
        }
        .onAppear {
            //TODO: Navigation 연결 시 수정
            viewModel.getDetails(groupId: 7, groupType: "WEEKLY") { _ in }
            
            viewModel.getOwnerInfo(groupId: 7, groupType: "WEEKLY") { _ in }
            
            viewModel.getComments(groupId: 7, groupType: "WEEKLY") { _ in }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
