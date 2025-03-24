//
//  TabBarState.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

enum TabBarState: CaseIterable {
    case filling
    case home
    case myPage
}

extension TabBarState {
    var title: String {
        switch self {
        case .filling: "채우기"
        case .home: "홈"
        case .myPage: "마이"
        }
    }
    
    var defaultImage: ImageResource {
        switch self {
        case .filling: .icTabbarFillGray26
        case .home: .icTabbarHomeGray26
        case .myPage: .icTabbarMyGray26
        }
    }
        
    var selectedImage: ImageResource {
        switch self {
        case .filling: .icTabbarFillBlack26
        case .home: .icTabbarHomeBlack26
        case .myPage: .icTabbarMyBlack26
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .filling: FillingView()
        case .home: HomeView()
        case .myPage: Color.gray05
        }
    }
}
