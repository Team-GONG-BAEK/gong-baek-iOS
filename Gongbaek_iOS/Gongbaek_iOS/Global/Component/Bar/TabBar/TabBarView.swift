//
//  TabBarView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab: TabBarState = .home // home 기본 선택
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                selectedTab.view()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    TabBarView()
}
