//
//  SettingBasicCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/28/25.
//

import SwiftUI

struct SettingBasicCell: View {
    let title: String
    let bodyText: String?
        
    var body: some View {
        HStack {
            Text(title)
                .pretendardFont(.body1_r_16)
                .foregroundColor(.grayBlack)
            
            if let bodyText, !bodyText.isEmpty {
                Spacer()
                Text(bodyText)
                    .pretendardFont(.body1_r_16)
                    .foregroundColor(.gray04)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SettingBasicCell(title: "test", bodyText: "test")
    SettingBasicCell(title: "test", bodyText: nil)
    SettingHeaderCell(title: "Test")
}
