//
//  OnboardingIndicator.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import SwiftUI

struct OnboardingIndicator: View {
    let pageCount: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<pageCount, id: \..self) { index in
                Circle()
                    .fill(index == currentPage ? .gray08 : .gray03)
                    .frame(width: 6, height: 6)
            }
        }
        .frame(height: 6)
        .padding(.vertical, 46)
    }
}

