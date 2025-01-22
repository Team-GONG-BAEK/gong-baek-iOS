//
//  OnboardingNavigation.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import SwiftUI

struct OnboardingNavigation: View {
    @Binding var currentPage: Int
    let pageCount: Int
    
    var body: some View {
        HStack {
            if currentPage > 0 {
                Button(action: {
                    withAnimation { currentPage -= 1 }
                }) {
                    Image(.icArrowLeft48)
                        .foregroundColor(.gray04)
                        .frame(width: 48, height: 48)
                }
            } else {
                Spacer().frame(width: 48, height: 48)
            }
            Spacer()
        }
        .padding(.bottom, 54)
    }
}
