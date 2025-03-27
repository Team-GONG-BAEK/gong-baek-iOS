//
//  SettingHeaderCell.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/28/25.
//

import SwiftUI

struct SettingHeaderCell: View {
    let title: String
        
    var body: some View {
        Text(title)
            .pretendardFont(.title2_sb_18)
            .foregroundColor(.grayBlack)
            .padding(.vertical, 19)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
