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
                //임시 버튼
                Button(action: {
                    navigationManager.push(view: MyPageDestination.myPageSetting)
                }) {
                    Image(.icSetting48)
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                
                MyProfile(profile: viewModel.myProfile)
                Rectangle()
                    .fill(.gray01)
                    .frame(height: 8)
                MyPageSegmentControlBar(viewModel: viewModel)
            }
            
            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getMeetings()
                })
            }
        }
        .customNavigationBar(title: "마이페이지")
        .onAppear {
            viewModel.getMyProfile()
            viewModel.getMeetings()
        }
    }
}

#Preview {
    MyPageView(viewModel: MyPageViewModel())
}
