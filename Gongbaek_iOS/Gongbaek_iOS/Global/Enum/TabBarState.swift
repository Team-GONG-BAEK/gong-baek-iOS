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
    var tabTitle: String {
        switch self {
        case .filling: "채우기"
        case .myFilling: "나의 채움"
        case .home: "홈"
        case .timetable: "시간표"
        case .myPage: "마이"
        }
    }
    
    var tabImage: String {
        switch self {
        case .filling: "ic_tabbar_fill_gray_26"
        case .myFilling: "ic_tabbar_my_fill_gray_26"
        case .home: "ic_tabbar_home_gray_26"
        case .timetable: "ic_tabbar_timetable_gray_26"
        case .myPage: "ic_tabbar_my_gray_26"
        }
    }
    
    var tabSelectedImage: String {
        switch self {
        case .filling: "ic_tabbar_fill_black_26"
        case .myFilling: "ic_tabbar_my_fill_black_26"
        case .home: "ic_tabbar_home_black_26"
        case .timetable: "ic_tabbar_timetable_black_26"
        case .myPage: "ic_tabbar_my_black_26"
        }
    }
    
    @ViewBuilder
    func view(showGuideView: Binding<Bool>) -> some View {
        switch self {
        case .filling: CustomSegmentControlBar(segmentState: .detail)
        case .myFilling: CustomSegmentControlBar(segmentState: .myfill)
        case .home: CustomSegmentControlBar(segmentState: .detail)
        case .timetable: CustomSegmentControlBar(segmentState: .myfill)
        case .myPage: CustomSegmentControlBar(segmentState: .detail)
        }
    }
}
