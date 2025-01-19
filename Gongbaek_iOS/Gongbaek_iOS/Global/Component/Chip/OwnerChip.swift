//
//  OwnerChip.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

enum OwnerChipType {
    case gray09
    case gray01
}

struct OwnerChip: View {
    var ownerChipType: OwnerChipType = .gray01
    
    var body: some View {
        Text("모집자")
            .pretendardFont(.caption2_m_12)
            .padding(.horizontal, 6)
            .padding(.vertical, 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(ownerChipType == .gray09 ? .gray09 : .gray01 )
            )
            .foregroundStyle(.mainOrange)
    }
}
