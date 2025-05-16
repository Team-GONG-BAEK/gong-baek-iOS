//
//  SelectedTimeBox.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct SelectedTimeBox: View {
    var time: String
    
    var body: some View {
        Text(time)
            .pretendardFont(.title2_b_18)
            .foregroundColor(.gray09)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray02, lineWidth: 1)
            }
        
        
    }
}

#Preview {
    SelectedTimeBox(time: "00:00")
}
