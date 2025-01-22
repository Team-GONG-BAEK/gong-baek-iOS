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
                if let image = category.categoryImage { image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 78, height: 78)
                }
                
                Text(category.categoryName)
                    .font(.pretendard(.body1_m_16))
                    .foregroundColor(.gray08)
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .padding(.vertical, 15)
            .background(isSelected ? .subOrange : .gray01)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, minHeight: 120)
    }
}

#Preview {
    CategoryImageButton(category: .STUDY, isSelected: true)
}
