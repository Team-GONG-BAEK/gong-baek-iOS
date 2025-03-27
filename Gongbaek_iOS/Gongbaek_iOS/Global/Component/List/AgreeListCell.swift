//
//  AgreeButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/26/25.
//

import SwiftUI

struct AgreeListCell: View {
    var text: String
    @Binding var isSelected: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                isSelected.toggle()
                onTap?()
            }) {
                Image(.checkGray32)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .mainOrange : .gray03)
                    .frame(width: 32, height: 32)
            }
            
            Text(text)
                .pretendardFont(.body2_m_14)
                .foregroundColor(.gray09)
            Spacer()
            
            Button(action: {}) {
                Image(.icArrowRight32)
                    .foregroundColor(.gray04)
                    .frame(width: 32, height: 32)
            }
            
        }
    }
}

//#Preview {
//    AgreeListCell(text: "[필수] 서비스 이용약관", isSelected: true)
//}
