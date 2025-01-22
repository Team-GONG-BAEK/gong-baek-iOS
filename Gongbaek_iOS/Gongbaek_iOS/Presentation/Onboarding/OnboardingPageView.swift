//
//  OnboardingPageView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleTextBox(
                title: page.title,
                subtitle: page.subtitle,
                highlightSubtitleText: page.highlight
            )
            .padding(.bottom, 54)
            
            Image(page.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
