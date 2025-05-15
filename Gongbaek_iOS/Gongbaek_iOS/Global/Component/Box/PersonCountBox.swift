//
//  PersonCountBox.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

struct PersonCountBox: View {
    var num: Int
    
    var body: some View {
        Text("\(num)명")
            .pretendardFont(.title1_b_20)
            .foregroundColor(.gray10)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 11)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray03, lineWidth: 1)
            }
        
        
    }
}

#Preview {
    PersonCountBox(num: 2)
}
