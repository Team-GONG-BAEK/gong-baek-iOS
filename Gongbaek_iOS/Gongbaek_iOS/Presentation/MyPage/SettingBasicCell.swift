//
//  SettingBasicCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/28/25.
//

import SwiftUI

struct SettingBasicCell: View {
    let id: UUID = UUID()
    let title: String
    let type: SettingItemType
        
    var body: some View {
        HStack {
            Text(title)
                .pretendardFont(.body1_r_16)
                .foregroundColor(.grayBlack)
            
            if case let .info(subtitle?) = type, !subtitle.isEmpty {
                Spacer()
                Text(subtitle)
                    .pretendardFont(.body1_r_16)
                    .foregroundColor(.gray04)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
