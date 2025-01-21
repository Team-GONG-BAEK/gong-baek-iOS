//
//  SearchListCell.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SearchListCell: View {
    let name: String
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isSelected ? .subOrange : .grayWhite)
                .frame(maxWidth: .infinity, minHeight: 52)
            
            HStack {
                Text(name)
                    .pretendardFont(isSelected ? .body1_m_16 : .body1_r_16)
                    .foregroundStyle(isSelected ? .mainOrange : .gray08)
                
                Spacer()
                
                if isSelected {
                    Image(.icCheck24)
                        .renderingMode(.original)
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                }
            }
            .padding(.horizontal, 16)
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .frame(height: 52)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SearchListCell(name: "공백학과", isSelected: .constant(true))
    SearchListCell(name: "공백학과", isSelected: .constant(false))
}
