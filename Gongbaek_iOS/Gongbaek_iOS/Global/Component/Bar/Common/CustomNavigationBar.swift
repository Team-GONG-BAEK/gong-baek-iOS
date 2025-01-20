//
//  CustomNavigationBar.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct CustomNavigationBarModifier: ViewModifier {
    @EnvironmentObject var navigationManager: NavigationManager
    @Environment(\.dismiss) private var dismiss
    let title: String?
    let viewName: String?
    let showBackButton: Bool
    let showXButton: Bool
    let onBackButtonTap: (() -> Void)?

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            ZStack {
                leftRightButtons()
                if let title = title {
                    titleText(title)
                }
            }
            .frame(height: 48)
            .background(.clear)
            content
        }
    }
    
    private func leftRightButtons() -> some View {
        HStack {
            if showBackButton {
                Button(action: {
                    if let onBackButtonTap = onBackButtonTap {
                        onBackButtonTap()
                    } else {
                        navigationManager.pop()
                    }
                }) {
                    HStack(spacing: 4) {
                        Image(.icArrowLeft48)
                            .frame(width: 48, height: 48)
                        if let viewName = viewName {
                            Text(viewName)
                                .pretendardFont(.title2_m_18)
                                .foregroundStyle(.gray08)
                        }
                    }
                }
            }
            
            Spacer()
            
            if showXButton {
                Button(action: { dismiss() }) {
                    Image(.icX48)
                        .frame(width: 48, height: 48)
                }
            }
        }
    }
        
    private func titleText(_ title: String) -> some View {
        Text(title)
            .pretendardFont(.title2_m_18)
            .foregroundColor(.gray08)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
        .customNavigationBar(viewName: "채우기", showBackButton: true, showXButton: true)
    ContentView()
        .customNavigationBar(title: "채우기")
}
