//
//  TabBarView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab: TabBarState = .filling
    @Binding var showGuideView: Bool
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                selectedTab.view(showGuideView: $showGuideView)
                CustomTabView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    TabBarView(showGuideView: .constant(false))
}
