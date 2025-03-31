//
//  OnBoardingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/20/25.
//

import SwiftUI

struct OnboardingPage {
    let title: String
    let subtitle: String
    let highlight: String
    let image: String
}

struct OnboardingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var currentPage = 0
    
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "공강시간에 원하는 모임 만들기",
            subtitle: "공강이라는 공백, 어떻게 채우고 있나요?\n이제 같은 캠퍼스 친구들과 특별하게 채워보세요.",
            highlight: "공강이라는 공백,",
            image: "img_onboarding_1"
        ),
        OnboardingPage(
            title: "모임 신청하고 함께 활동하기",
            subtitle: "채우기 탭에서 원하는 모임을 신청하고,\n0이었던 공백을 100으로 알차게 채워보세요!",
            highlight: "0이었던 공백을 100으로",
            image: "img_onboarding_2"
        ),
        OnboardingPage(
            title: "스페이스에서 모임 멤버와 대화하기",
            subtitle: "공백을 함께 채울 맴버들과\n스페이스에서 대화하며 모임을 준비해보세요!",
            highlight: "스페이스에서 대화하며",
            image: "img_onboarding_3"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            OnboardingNavigation(currentPage: $currentPage, pageCount: pages.count)
            
            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    ForEach(pages.indices, id: \..self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                OnboardingIndicator(pageCount: pages.count, currentPage: currentPage)
                
                BasicButton(
                    text: currentPage == pages.count - 1 ? "시작하기" : "다음",
                    onTap: {
                        withAnimation {
                            if currentPage < pages.count - 1 {
                                currentPage += 1
                            } else {
                                // TODO: - signupView로 화면 전환
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
                .frame(height: 94)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
