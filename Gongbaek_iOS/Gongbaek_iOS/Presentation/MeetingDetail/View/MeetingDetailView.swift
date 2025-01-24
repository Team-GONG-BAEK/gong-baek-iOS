//
//  MeetingDetailView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingDetailView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = MeetingDetailViewModel()
    let groupId: Int
    let groupType: String
    
    var body: some View {
        VStack(spacing: 0) {
            MeetingInfoBase(
                state: .detail,
                meeting: viewModel.meeting)
            .padding(16)
            
            divider()
            
            MeetingDetailSegmentControlBar(viewModel: viewModel)
        }
        .customNavigationBar(showBackButton: true)
        .onAppear {
            viewModel.getDetails(groupId: groupId, groupType: groupType) { _ in }
            
            viewModel.getOwnerInfo(groupId: groupId, groupType: groupType) { _ in }
            
            viewModel.getComments(groupId: groupId, groupType: groupType) { _ in }
        }
    }
    
    func divider() -> some View {
        Color.gray02.frame(height: 8)
    }
}
