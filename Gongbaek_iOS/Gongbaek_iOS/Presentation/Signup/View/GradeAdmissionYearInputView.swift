//
//  GradeAdmissionYearInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct GradeAdmissionYearInputView: View {
    @State private var selectedGrade: GradeState? = nil
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: 3)
            
            TitleTextBox(
                title: "학년과 입학연도를 입력해주세요.",
                subtitle: "프로필에 표시되는 정보로, 언제든 변경할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            gradeButtons()
            
            Spacer()
            
//            BasicButton(
//                text: "다음",
//                isActivated:
//            ) {
//                navigationManager.push(view: SignupDestination.gradeAdmissionYearInput)
//            }
//            .padding(.horizontal, 16)
//            .padding(.bottom, 20)
        }
        .customNavigationBar(showBackButton: true)
    }
    
    private func gradeButtons() -> some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(GradeState.allCases.indices, id: \.self) { index in
                SmallButton(
                    text: GradeState.allCases[index].rawValue,
                    isTapped: selectedGrade == GradeState.allCases[index]
                ) {
                    selectedGrade = GradeState.allCases[index]
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    GradeAdmissionYearInputView()
}
