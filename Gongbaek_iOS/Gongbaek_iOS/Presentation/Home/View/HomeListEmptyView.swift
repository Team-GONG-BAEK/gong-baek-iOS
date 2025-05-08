//
//  HomeListEmptyView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/27/25.
//

import SwiftUI

struct HomeListEmptyView: View {
    let type: GroupState
    
    var body: some View {
        VStack(spacing: 6) {
            Image(type.emptyImage)
                .resizable()
                .scaledToFit()
                .frame(width: 74, height: 58)
            
            Text("활동 가능한 모임이 없어요.\n직접 모임을 만들어보는건 어때요?")
                .pretendardFont(.caption1_r_13)
                .foregroundStyle(.gray07)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 35)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(.gray01)
        )
    }
}

#Preview {
    VStack {
        HomeListEmptyView(type: .ONCE)
        HomeListEmptyView(type: .WEEKLY)
    }
}
