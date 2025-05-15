//
//  MajorDirectRegistrationButton.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct MajorDirectRegistrationButton: View {
    var majorName: String
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
            HStack(spacing: 2) {
                Text("'\(majorName)'")
                    .pretendardFont(.caption2_b_12)
                    .foregroundStyle(.mainOrange)
                
                HStack(spacing: 0) {
                    Text("(으)로 직접 등록할래요")
                        .pretendardFont(.caption2_m_12)
                        .foregroundColor(.gray08)
                    
                    Image(.icPlusBlack18)
                        .renderingMode(.original)
                        .frame(width: 18, height: 18)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 42)
        .background(.gray02)
        .clipShape(
            RoundedRectangle(cornerRadius: 3)
        )
    }
}

#Preview {
    MajorDirectRegistrationButton(majorName: "기묘한학과") {}
}
