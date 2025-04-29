//
//  MyFillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel = MyPageViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MyProfile(profile: viewModel.myProfile)
                Rectangle()
                    .fill(.gray01)
                    .frame(height: 8)
                MyPageSegmentControlBar(viewModel: viewModel)
            }
            .customNavigationBar(title: "마이페이지", rightButtonType: .setting) {
                navigationManager.push(view: MyPageDestination.myPageSetting)
            }
            
            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getMeetings()
                })
            }
        }
        .onAppear {
            viewModel.getMyProfile()
        }
    }
}

#Preview {
    MyPageView(viewModel: MyPageViewModel())
}
