//
//  MyFillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = MyPageViewModel()
    
    var body: some View {
        ZStack {
            if let myProfile = viewModel.myProfile {
                VStack(spacing: 0) {
                    MyProfile(profile: myProfile)
                    Rectangle()
                        .fill(.gray01)
                        .frame(height: 8)
                    MyPageSegmentControlBar(viewModel: viewModel)
                }
                .customNavigationBar(title: "마이페이지", rightButtonType: .setting) {
                    navigationManager.push(view: MyPageDestination.myPageSetting)
                }
            }
            
            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getMyProfile()
                    viewModel.getMeetings()
                })
                .customNavigationBar(title: "마이페이지")
            }
        }
        .onAppear {
            viewModel.getMyProfile()
            viewModel.getMeetings()
        }
    }
}

#Preview {
    MyPageView(viewModel: MyPageViewModel())
}
