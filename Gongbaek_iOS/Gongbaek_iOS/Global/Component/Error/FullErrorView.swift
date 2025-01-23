//
//  FullErrorView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import SwiftUI

struct FullErrorView: View {
    var onTapRetryButton: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 14) {
            Spacer()
            
            VStack(spacing: 26) {
                Image(.imgError)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 178)
                
                Text("앗! 화면을 채우는 중 작은 문제가 발생했어요.")
                    .pretendardFont(.caption1_m_13)
                    .foregroundStyle(.gray08)
            }
            
            Button {
                onTapRetryButton?()
            } label: {
                Text("다시 시도하기")
                    .pretendardFont(.caption2_b_12)
                    .foregroundStyle(.grayWhite)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
            }
            .background(.mainOrange)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.gray01)
    }
}

#Preview {
    FullErrorView()
}
