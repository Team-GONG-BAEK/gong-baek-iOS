//
//  CustomAlert.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct CustomedAlert: View {
    let alertImage: String
    let titleText: String
    var subtitleText: String? = nil
    var grayButtonText: String? = nil
    let orangeButtonText: String
    var onTapGrayButton: (() -> Void)?
    var onTapOrangeButton: (() -> Void)?
    
    var body: some View {
        ZStack {
            backgroundBlack()
            
            VStack (alignment: .center, spacing: 0) {
                Image(alertImage) //TODO: 이미지 수정
                    .resizable()
                    .background(.gray02) //TODO: 이미지 수정 시 삭제
                    .frame(width: 178, height: 178)
                    .padding(.horizontal, 20)
                
                VStack(spacing: 0) {
                    titleTextBox(text: titleText)
                    
                    if let subtitleText = subtitleText {
                        subtitleTextBox(text: subtitleText)
                    }
                }
                .padding(.vertical, 20)
                .padding(.top, subtitleText != nil ? 8 : 0)
                
                HStack(alignment: .center, spacing: 10) {
                    if let grayButtonText = grayButtonText {
                        grayButton(buttonText: grayButtonText, buttonAction: onTapGrayButton)
                    }
                    
                    orangeButton(buttonText: orangeButtonText, buttonAction: onTapOrangeButton)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, subtitleText != nil ? 48 : 34)
            .padding(.bottom, 20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.grayWhite)
            )
            .padding(.horizontal, 42)
            .padding(.vertical, 236)
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
                .padding(.vertical, 12)
                .padding(.horizontal, 21.5)
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
                .padding(.vertical, 12)
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
    CustomedAlert(
        alertImage: "sample",
        titleText: "모임등록이완료되었다면믿으시겠습니까욥",
        subtitleText: "아니요 모르겠고 내 뷰나 책입져 이자식아!!! 나 집에 갈래!!! 으악으악\n으악아악악!!!!",
        grayButtonText: "닫기",
        orangeButtonText: "다음으로",
        onTapGrayButton: nil,
        onTapOrangeButton: nil
    )
}
