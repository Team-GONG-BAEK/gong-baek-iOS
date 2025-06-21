//
//  BasicAlert.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/17/25.
//

import SwiftUI

struct BasicAlert: View {
    let title: String
    var subtitle: String? = nil
    var grayButtonText: String? = nil
    let orangeButtonText: String
    var onTapGrayButton: (() -> Void)?
    var onTapOrangeButton: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .center) {
            backgroundBlack()
            
            VStack (alignment: .center, spacing: 0) {
                titleTextBox()
                    .padding(.top, 28)
                    .padding(.bottom, subtitle == nil ? 28 : 14)
                if let subtitle = subtitle {
                    subtitleTextBox(text: subtitle)
                        .padding(.bottom, 16)
                }
            
                HStack(alignment: .center, spacing: 10) {
                    if let grayButtonText = grayButtonText {
                        grayButton(buttonText: grayButtonText, buttonAction: onTapGrayButton)
                    }
                    
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
    
    func titleTextBox() -> some View {
        Text(title)
            .pretendardFont(.body1_sb_16)
            .lineLimit(nil)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(.gray10)
    }
    
    func subtitleTextBox(text: String) -> some View {
        Text(text)
            .pretendardFont(.body2_r_14)
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
                .pretendardFont(.body1_sb_16)
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
                .pretendardFont(.body1_sb_16)
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
        title: "로그아웃하시겠습니가",
        subtitle: "모임을 신고할 경우,\n운영팀에서 검토를 거쳐 24시간 내에\n적절한 조치 및 게시자 제재를 취할 것입니다.",
        grayButtonText: "취소",
        orangeButtonText: "확인",
        onTapGrayButton: nil,
        onTapOrangeButton: nil
    )
}
