//
//  AgreeButton.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/26/25.
//

import SwiftUI

struct AgreementListCell: View {
    var state: AgreeState
    var onLinkTap: ((AgreeState) -> Void)?
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                isSelected.toggle()
            }) {
                Image(.checkGray32)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .mainOrange : .gray03)
                    .frame(width: 32, height: 32)
            }
            
            Text(state.titleText)
                .pretendardFont(.body2_m_14)
                .foregroundColor(.gray09)
            Spacer()
            
            Link(destination: state.webURL) {
                Image(.icArrowRight32)
                    .foregroundColor(.gray04)
                    .frame(width: 32, height: 32)
            }
        }
    }
}

//#Preview {
//    AgreeListCell(text: "[필수] 서비스 이용약관", isSelected: true)
//}
