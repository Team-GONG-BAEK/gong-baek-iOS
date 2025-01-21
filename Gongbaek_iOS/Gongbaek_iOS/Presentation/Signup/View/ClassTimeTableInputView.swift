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
            // TODO: 스크롤 영역 수정 가능성 있음
            ScrollView {
                TitleTextBox(
                    title: "수업 시간표를 입력해주세요.",
                    subtitle: "수업 시간표를 입력하면, 공강 시간표로 바꿔드려요.",
                    highlightSubtitleText: "수업 시간표"
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
                
                OnboardingTimeTable(
                    selectedCells: $viewModel.selectedCells,
                    classTimeTable: $viewModel.classTimeTable
                )
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
