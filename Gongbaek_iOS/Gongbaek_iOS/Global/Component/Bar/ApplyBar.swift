//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: TODO - Model 분리 예정

struct Apply {
    var isActivated: Bool
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var buttonText: String
    var onTap: (() -> Void)?
}

struct ApplyBar: View {
    var apply: Apply
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(apply.currentPeopleCount) / \(apply.maxPeopleCount) 명")
                .pretendardFont(.title2_sb_18)
                .padding(16)
                .foregroundStyle(apply.isActivated ? .gray01 : .grayWhite)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(apply.isActivated ? .gray09 : .gray04)
                )
            
            BasicButton(text: "엘렐레", isActivated: apply.isActivated, onTap: apply.onTap)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    ApplyBar(apply: Apply(isActivated: true, currentPeopleCount: 3, maxPeopleCount: 4, buttonText: "엘렐레", onTap: nil))
}
