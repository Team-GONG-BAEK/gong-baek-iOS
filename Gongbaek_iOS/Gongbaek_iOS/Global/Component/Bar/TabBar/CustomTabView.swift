//
//  CustomTabView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/17/25.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: TabBarState
    
    var body: some View {
        HStack {
            TabButton(
                tab: .filling,
                selectedTab: $selectedTab,
                imageName: TabBarState.filling.image,
                selectedImageName: TabBarState.filling.selectedImage,
                text: TabBarState.filling.title
            )
            Spacer()
            TabButton(
                tab: .myFilling,
                selectedTab: $selectedTab,
                imageName: TabBarState.myFilling.image,
                selectedImageName: TabBarState.myFilling.selectedImage,
                text: TabBarState.myFilling.title
            )
            Spacer()
            TabButton(
                tab: .home,
                selectedTab: $selectedTab,
                imageName: TabBarState.home.image,
                selectedImageName: TabBarState.home.selectedImage,
                text: TabBarState.home.title
            )
            Spacer()
            TabButton(
                tab: .timetable,
                selectedTab: $selectedTab,
                imageName: TabBarState.timetable.image,
                selectedImageName: TabBarState.timetable.selectedImage,
                text: TabBarState.timetable.title
            )
            Spacer()
            TabButton(
                tab: .myPage,
                selectedTab: $selectedTab,
                imageName: TabBarState.myPage.image,
                selectedImageName: TabBarState.myPage.selectedImage,
                text: TabBarState.myPage.title
            )
        }
        .padding(.top, 8)
        .padding(.horizontal, 12)
        .background(.grayWhite)
    }
    
}

struct TabButton: View {
    let tab: TabBarState
    @Binding var selectedTab: TabBarState
    let imageName: String
    let selectedImageName: String
    let text: String
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 2) {
                Image(selectedTab == tab ? selectedImageName : imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                
                Text(text)
                    .pretendardFont(.body2_m_14)
                    .foregroundStyle(selectedTab == tab ? .grayBlack : .gray05)
            }
            .frame(width: 56, height: 54)
        }
    }
}

#Preview {
    TabBarView(showGuideView: .constant(false))
}
