//
//  AgreeView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/26/25.
//

import SwiftUI

struct AgreeView: View {
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading , spacing: 12) {
                HStack(spacing: 8) {
                    Button(action: {}){
                        Image(.checkUnfill32)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Text("약관 전체동의")
                        .pretendardFont(.title2_m_18)
                        .foregroundColor(.grayBlack)
                }
                
                Divider()
                    .foregroundColor(.gray02)
                
                VStack(spacing: 8) {
                    AgreeListCell(text: "[필수] 서비스 이용약관", isSelected: false)
                    AgreeListCell(text: "[필수] 개인정보 처리 방침", isSelected: false)
                }
                .padding(.trailing, -12)
                
                Spacer()
                
                BasicButton(text: "다음", isActivated: false)
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 38)
        }
        .customNavigationBar(title: "약관 동의", showBackButton: true)
    }
}

#Preview {
    AgreeView()
}
