//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: TODO - Model 분리 예정

struct ApplyModel {
    var isActivated: Bool
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var buttonText: String
    var onTap: (() -> Void)?
}

struct ApplyBar: View {
    var applyData: ApplyModel
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(applyData.currentPeopleCount) / \(applyData.maxPeopleCount) 명")
                .pretendardFont(.title2_sb_18)
                .padding(16)
                .foregroundStyle(applyData.isActivated ? .gray01 : .grayWhite)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(applyData.isActivated ? .gray09 : .gray04)
                )
            
            BasicButton(text: applyData.buttonText, isActivated: applyData.isActivated, onTap: applyData.onTap)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    ApplyBar(
        applyData: ApplyModel(
            isActivated: true,
            currentPeopleCount: 3,
            maxPeopleCount: 4,
            buttonText: "엘렐레",
            onTap: nil
        )
    )
}
