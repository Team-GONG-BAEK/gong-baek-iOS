//
//  CustomNavigationBar.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

enum NavigationBarRightButtonType {
    case x
    case setting
    case report
    
    var image: ImageResource {
        switch self {
        case .x: .icX48
        case .setting: .icSetting48
        case .report: .icReport48
        }
    }
}

struct CustomNavigationBarModifier: ViewModifier {
    @EnvironmentObject var navigationManager: NavigationManager
    let isMeetingRoom: Bool
    let title: String?
    let viewName: String?
    let showBackButton: Bool
    let onBackButtonTap: (() -> Void)?
    let rightButtonType: NavigationBarRightButtonType?
    let onRightButtonTap: (() -> Void)?
    
    func body(content: Content) -> some View {
        if isMeetingRoom == true {
            ZStack(alignment: .top) {
                content
                VStack(spacing: 0) {
                    ZStack {
                        leftRightButtons()
                        if let title = title {
                            titleText(title)
                        }
                    }
                    .frame(height: 48)
                    .background(.clear)
                }
            }
        } else {
            VStack {
                VStack(spacing: 0) {
                    ZStack {
                        leftRightButtons()
                        if let title = title {
                            titleText(title)
                        }
                    }
                    .frame(height: 48)
                    .background(.clear)
                }
                content
            }
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
                    HStack(alignment: .center, spacing: 4) {
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
            
            if let rightButtonType,
               let onRightButtonTap {
                Button(action: { onRightButtonTap() }) {
                    Image(rightButtonType.image)
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
