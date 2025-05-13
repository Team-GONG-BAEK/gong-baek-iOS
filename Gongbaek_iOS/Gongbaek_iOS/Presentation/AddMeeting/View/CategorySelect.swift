//
//  CategorySelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct CategorySelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    var body: some View {
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
                        })
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
