//
//  CoverImageButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/12/25.
//

import SwiftUI

struct CoverImageButton: View {
    var image: ImageResource
    var isSelected: Bool
    var onTap: (() -> Void)?
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Button(action: {
                    onTap?()
                }) {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            if isSelected {
                Rectangle()
                    .fill(Color.grayBlack.opacity(0.6))
                    .cornerRadius(4)
                Image(.icCheckFill24)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .frame(width: 24, height: 24)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    CoverImageButton(image: .sample, isSelected: true)
        .frame(width: 109, height: 109)
}

