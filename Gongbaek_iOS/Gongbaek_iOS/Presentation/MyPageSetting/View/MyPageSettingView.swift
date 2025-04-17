//
//  MyPageSettingView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/25/25.
//

import SwiftUI

struct MyPageSettingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = MyPageSettingViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(MyPageSettingSection.settingList) { section in
                    SettingHeaderCell(type: section.header)
                    
                    ForEach(section.items) { item in
                        settingCell(for: item)
                    }
                    
                    if section.header == .information {
                        Color(.gray01).frame(height: 8)
                    }
                }
                Spacer()
            }
            
            if viewModel.showAlert {
                BasicAlert(
                    titleText: "\(viewModel.selectedAction == .logout ? "로그아웃을" : "회원탈퇴를") 진행하시겠습니까?",
                    grayButtonText: "취소",
                    orangeButtonText: "확인",
                    onTapGrayButton: {
                        viewModel.showAlert = false
                    },
                    onTapOrangeButton: {
                        viewModel.confirmAction()
                    }
                )
            }
        }
        .onChange(of: viewModel.isSignedOut) {
            if viewModel.isSignedOut {
                navigationManager.rootView = .login
            }
        }
    }
}

extension MyPageSettingView {
    @ViewBuilder
    func settingCell(for item: SettingItem) -> some View {
        switch item.type {
        case .webLink(let urlString):
            if let url = URL(string: urlString) {
                Link(destination: url) {
                    SettingBasicCell(title: item.title, type: item.type)
                }
            }
        case .info:
            SettingBasicCell(title: item.title, type: item.type)
            
        case .action(let actionType):
            Button {
                viewModel.performAction(actionType)
            } label: {
                SettingBasicCell(title: item.title, type: item.type)
            }
        }
    }
}

#Preview {
    MyPageSettingView()
}
