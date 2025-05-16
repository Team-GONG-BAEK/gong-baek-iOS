//
//  RegisterCategoryButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/11/25.
//

import SwiftUI

struct CategoryImageButton: View {
    var category: CategoryState
    var isSelected: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            VStack(spacing: 10) {
                if let image = category.categoryImage {
                    let size = 78/812 * UIScreen.main.bounds.height
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                }
                
                Text(category.categoryName)
                    .pretendardFont(.body1_m_16)
                    .foregroundColor(.gray08)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(isSelected ? .subOrange : .gray01)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

#Preview {
    CategoryImageButton(category: .STUDY, isSelected: true)
}
