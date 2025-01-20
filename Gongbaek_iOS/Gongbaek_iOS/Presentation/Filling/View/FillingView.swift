//
//  FillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct FillingView: View {
    @StateObject private var viewModel = FillingViewModel()
    @StateObject private var addViewModel = AddMeetingViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    WeekFilterBar()
                        .padding(.bottom, 8)
                    CategoryBar(viewModel: viewModel)
                        .padding(.bottom, 8)
                    Rectangle()
                        .fill(.gray01)
                        .frame(height: 8)
                    FillingList()
                    Spacer()
                }
                
                AddMeetingButton {
                    navigationManager.push(view: FillingDestination.addMeeting) 
                }
                .padding(.trailing, 16)
                .padding(.bottom, 24)
                
            }
            .customNavigationBar(title: "채우기", showXButton: false)
            .navigationDestination(for: FillingDestination.self) { type in
                type.view(viewModel: addViewModel)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    FillingView()
}
