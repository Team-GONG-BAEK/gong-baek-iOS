//
//  CustomTabBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabBarState
    
    var body: some View {
        HStack {
            tabButton(
                tab: .filling,
                selectedTab: $selectedTab,
                imageName: TabBarState.filling.defaultImage,
                selectedImageName: TabBarState.filling.selectedImage,
                text: TabBarState.filling.title
            )
            Spacer()
            tabButton(
                tab: .myFilling,
                selectedTab: $selectedTab,
                imageName: TabBarState.myFilling.defaultImage,
                selectedImageName: TabBarState.myFilling.selectedImage,
                text: TabBarState.myFilling.title
            )
            Spacer()
            tabButton(
                tab: .home,
                selectedTab: $selectedTab,
                imageName: TabBarState.home.defaultImage,
                selectedImageName: TabBarState.home.selectedImage,
                text: TabBarState.home.title
            )
            Spacer()
            tabButton(
                tab: .timetable,
                selectedTab: $selectedTab,
                imageName: TabBarState.timetable.defaultImage,
                selectedImageName: TabBarState.timetable.selectedImage,
                text: TabBarState.timetable.title
            )
            Spacer()
            tabButton(
                tab: .myPage,
                selectedTab: $selectedTab,
                imageName: TabBarState.myPage.defaultImage,
                selectedImageName: TabBarState.myPage.selectedImage,
                text: TabBarState.myPage.title
            )
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.grayWhite)
    }
    
    func tabButton (
        tab: TabBarState,
        selectedTab: Binding<TabBarState>,
        imageName: ImageResource,
        selectedImageName: ImageResource,
        text: String
    ) -> some View {
        Button(action: {
            self.selectedTab = tab
        }) {
            VStack(spacing: 2) {
                Image(self.selectedTab == tab ? tab.selectedImage : tab.defaultImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                
                Text(text)
                    .pretendardFont(.body2_m_14)
                    .foregroundStyle(self.selectedTab == tab ? .grayBlack : .gray05)
            }
            .frame(width: 56, height: 54)
            
        }
    }
}

#Preview {
    TabBarView()
}
