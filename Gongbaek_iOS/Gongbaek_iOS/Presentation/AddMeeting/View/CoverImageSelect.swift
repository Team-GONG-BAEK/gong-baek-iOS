//
//  CoverImageSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct CoverImageSelect: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject private var viewModel = AddMeetingViewModel()
    
    @State private var selectedCoverIndex: Int? = nil
    
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        VStack {
            ProgressBar(currentIndex: $viewModel.currentIndex)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 0) {
                TitleTextBox(title: "커버 사진을 선택해주세요.", subtitle: "제공된 사진 중 하나를 선택할 수 있어요.")
                    .padding(.bottom, 28)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Array((viewModel.selectedCategory?.coverImage ?? []).enumerated()), id: \.0) { index, image in
                        CoverImageButton(
                            image: image,
                            isSelected: selectedCoverIndex == index,
                            onTap: {
                                selectedCoverIndex = index
                                viewModel.selectedCoverImage = image
                                viewModel.isNextEnabled = true
                            }
                        )
                        .frame(height: 138)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            BasicButton(text: "다음", isActivated: viewModel.isNextEnabled) {
                navigationManager.push(view: FillingDestination.locationInput)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
        .customNavigationBar(showBackButton: true)
    }
}
