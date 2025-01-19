//
//  CategorySelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CategorySelect: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var viewModel = AddMeetingViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "카테고리를 선택해주세요.", subtitle: "6가지 카테고리 중 하나를 선택할 수 있어요.")
                    .padding(.bottom, 28)
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(CategoryState.allCases.filter { $0 != .ALL }, id: \.self) { category in
                        CategoryImageButton(
                            category: category,
                            isSelected: viewModel.selectedCategory == category,
                            onTap: {
                                viewModel.selectedCategory = category
                                viewModel.isNextEnabled = true
                            })
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                navigationManager.push(view: FillingDestination.coverImageSelect)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}


