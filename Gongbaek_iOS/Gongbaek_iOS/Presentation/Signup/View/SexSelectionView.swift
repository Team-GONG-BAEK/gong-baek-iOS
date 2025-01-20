//
//  SexSelectionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct SexSelectionView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var selectedSex: SexType? = nil
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            TitleTextBox(
                title: "성별을 선택해주세요.",
                subtitle: "프로필에 표시되는 정보로, 언제든 변경할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            sexButtons()
            
            Spacer()
        }
    }
    
    private func sexButtons() -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("성별")
                    .pretendardFont(.body2_sb_14)
                    .foregroundStyle(.gray08)
                
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)
            
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(SexType.allCases.indices, id: \.self) { index in
                    SmallButton(
                        text: SexType.allCases[index].text,
                        isTapped: selectedSex == SexType.allCases[index]
                    ) {
                        selectedSex = SexType.allCases[index]
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SexSelectionView()
}
