//
//  ProfileSelectionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct ProfileSelectionView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var selectedIndex: Int? = nil
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)
    
    var body: some View {
        VStack {
            ProgressBar(currentIndex: 0)
            
            TitleTextBox(
                title: "프로필 사진을 선택해주세요.",
                subtitle: "제공된 프로필 중 하나를 선택할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            profileImageButtons()
            
            Spacer()
            
            BasicButton(
                text: "다음",
                isActivated: selectedIndex != nil
            ) {
                navigationManager.push(view: SignupDestination.nicknameInput)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar()
    }
    
    private func profileImageButtons() -> some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(ProfileImageMap.allCases.indices, id: \.self) { index in
                CoverImageButton(
                    image: ProfileImageMap.allCases[index].rawValue,
                    isSelected: index == selectedIndex
                ) {
                    selectedIndex = index
                }
                .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProfileSelectionView()
}
