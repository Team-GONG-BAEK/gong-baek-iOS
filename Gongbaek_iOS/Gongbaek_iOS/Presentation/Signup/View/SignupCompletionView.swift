//
//  SignupCompletionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct SignupCompletionView: View {
    var attributedText: AttributedString {
        var text = AttributedString("0을 100으로 채우러 가볼까요?")
        
        if let range0 = text.range(of: "0") {
            text[range0].foregroundColor = .mainOrange
        }
        
        if let range100 = text.range(of: "100") {
            text[range100].foregroundColor = .mainOrange
        }
        
        return text
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .center, spacing: 8) {
                Text("가입을 축하드려요!")
                    .pretendardFont(.head2_b_24)
                Text(attributedText)
                    .pretendardFont(.head2_b_24)
                    .padding(.bottom, 50)
                
                Image(.imgCongratulation)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            .padding(.top, 61)
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

#Preview {
    SignupCompletionView()
}
