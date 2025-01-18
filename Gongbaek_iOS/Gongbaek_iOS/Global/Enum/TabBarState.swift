//
//  TabBarState.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

enum TabBarState: CaseIterable {
    case filling
    case myFilling
    case home
    case timetable
    case myPage
}

extension TabBarState {
    var title: String {
        switch self {
        case .filling: "채우기"
        case .myFilling: "나의 채움"
        case .home: "홈"
        case .timetable: "시간표"
        case .myPage: "마이"
        }
    }
    
    var defaultImage: String {
        switch self {
        case .filling: "ic_tabbar_fill_gray_26"
        case .myFilling: "ic_tabbar_my_fill_gray_26"
        case .home: "ic_tabbar_home_gray_26"
        case .timetable: "ic_tabbar_timetable_gray_26"
        case .myPage: "ic_tabbar_my_gray_26"
        }
    }
    
    var selectedImage: String {
        switch self {
        case .filling: "ic_tabbar_fill_black_26"
        case .myFilling: "ic_tabbar_my_fill_black_26"
        case .home: "ic_tabbar_home_black_26"
        case .timetable: "ic_tabbar_timetable_black_26"
        case .myPage: "ic_tabbar_my_black_26"
        }
    }
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .filling: Color.gray01 // View 연결
        case .myFilling: Color.gray02 // View 연결
        case .home: Color.gray03 // View 연결
        case .timetable: Color.gray04 // View 연결
        case .myPage: Color.gray05 // View
        }
    }
}
