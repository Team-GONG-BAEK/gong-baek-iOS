//
//  ClassTimeTableInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct ClassTimeTableInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                TitleTextBox(
                    title: "수업 시간표를 입력해주세요.",
                    subtitle: "수업이 있는 시간대를 선택해주세요."
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
                
                OnboardingTimeTable(viewModel: viewModel)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ClassTimeTableInputView(viewModel: SignupViewModel())
}
