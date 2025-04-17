//
//  BasicAlert.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/17/25.
//

import SwiftUI

struct BasicAlert: View {
    let titleText: String
    var grayButtonText: String
    let orangeButtonText: String
    var onTapGrayButton: (() -> Void)?
    var onTapOrangeButton: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .center) {
            backgroundBlack()
            
            VStack (alignment: .center, spacing: 28) {
                    titleTextBox(text: titleText)
                
                .padding(.top, 28)
                
                HStack(alignment: .center, spacing: 10) {
                    grayButton(buttonText: grayButtonText, buttonAction: onTapGrayButton)
                    
                    orangeButton(buttonText: orangeButtonText, buttonAction: onTapOrangeButton)
                }
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 18)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.grayWhite)
            )
            .padding(.horizontal, 42)
        }
    }
    
    func backgroundBlack() -> some View {
        Rectangle()
            .fill(.grayBlack.opacity(0.7))
            .edgesIgnoringSafeArea(.all)
    }
    
    func titleTextBox(text: String) -> some View {
        Text(text)
            .pretendardFont(.title2_sb_18)
            .lineLimit(nil)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(.gray10)
    }
    
    func subtitleTextBox(text: String) -> some View {
        Text(text)
            .pretendardFont(.body2_m_14)
            .lineLimit(nil)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(.gray07)
            .padding(.vertical, 4)
    }
    
    func grayButton(buttonText: String, buttonAction: (() -> Void)?) -> some View {
        Button(action: {
            buttonAction?()
        }) {
            Text(buttonText)
                .pretendardFont(.title2_sb_18)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.grayWhite)
                .background(.gray08)
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
            
        }
    }
    
    func orangeButton(buttonText: String, buttonAction: (() -> Void)?) -> some View {
        Button(action: {
            buttonAction?()
        }) {
            Text(orangeButtonText)
                .pretendardFont(.title2_sb_18)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(.mainOrange)
                .foregroundStyle(.grayWhite)
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
        }
    }
}

#Preview {
    BasicAlert(
        titleText: "로그아웃하시겠습니가",
        grayButtonText: "취소",
        orangeButtonText: "확인",
        onTapGrayButton: nil,
        onTapOrangeButton: nil
    )
}
