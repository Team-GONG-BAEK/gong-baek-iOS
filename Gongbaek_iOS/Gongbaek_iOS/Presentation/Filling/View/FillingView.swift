//
//  FillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct FillingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var viewModel = FillingViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                CategoryBar(viewModel: viewModel)
                    .padding(.bottom, 8)
                Rectangle()
                    .fill(.gray02)
                    .frame(height: 8)
                FillingList(meetings: viewModel.meeting)
                Spacer()
            }
            
            AddMeetingButton {
                navigationManager.push(view: FillingDestination.addMeeting) 
            }
            .padding(.trailing, 16)
            .padding(.bottom, 24)
            
            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getFillling()
                })
            }
            
        }
        .customNavigationBar(title: "채우기")
        .onAppear {
            viewModel.getFillling()
        }
    }
}

#Preview {
    FillingView()
}
