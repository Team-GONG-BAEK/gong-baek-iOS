//
//  SignupCompletionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

struct SignupCompletionView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("가입을 축하드려요!")
                        .pretendardFont(.head2_b_24)
                    
                    Text("0을 100으로 채우러 가볼까요?")
                        .pretendardFont(.head2_b_24)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.top, 61)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SignupCompletionView()
}
