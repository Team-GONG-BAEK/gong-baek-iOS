//
//  GongBaekToast.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 6/27/25.
//

import SwiftUI

enum ToastType {
    case meetingReport
    case commentReport
    
    var message: String {
        switch self {
        case .meetingReport: "해당 모임 신고가 완료되었습니다."
        case .commentReport: "해당 댓글 신고가 완료되었습니다."
        }
    }
}

struct GongBaekToast: View {
    let type: ToastType
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .center, spacing: 4) {
                Image(.icCheckFill24)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(type.message)
                    .pretendardFont(.body2_r_14)
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(10)
            .background(Color.black)
            .cornerRadius(4)
            
            Spacer()
                .frame(height: type == .meetingReport ? 94 : 68)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    GongBaekToast(type: .commentReport)
}
