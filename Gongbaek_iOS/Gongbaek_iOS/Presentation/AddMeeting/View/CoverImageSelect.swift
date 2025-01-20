//
//  CoverImageSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct CoverImageSelect: View {
    @ObservedObject var viewModel: AddMeetingViewModel
    
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        let coverImages = viewModel.selectedCategory?.coverImage ?? []
        let enumeratedCoverImages = Array(coverImages.enumerated())
        
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(title: "커버 사진을 선택해주세요.", subtitle: "제공된 사진 중 하나를 선택할 수 있어요.")
                .padding(.bottom, 28)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(enumeratedCoverImages, id: \.0) { index, image in
                    CoverImageButton(
                        image: image,
                        isSelected: selectedCoverIndex == index,
                        onTap: {
                            selectedCoverIndex = index
                            viewModel.selectedCoverImage = image
                            isNextEnabled = true
                        }
                    )
                    .frame(height: 138)
                }
            }
        }
        .padding(.horizontal, 16)
        
    }
}
