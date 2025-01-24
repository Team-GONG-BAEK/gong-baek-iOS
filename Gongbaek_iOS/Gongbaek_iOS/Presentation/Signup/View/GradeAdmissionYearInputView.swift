//
//  GradeAdmissionYearInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct GradeAdmissionYearInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    @Binding var showYearPicker: Bool

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)

    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TitleTextBox(
                    title: "학년과 입학연도를 입력해주세요.",
                    subtitle: "프로필에 표시되는 정보로, 언제든 변경할 수 있어요."
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 44)
                
                gradeButtons()
                
                YearSelectButton(
                    viewModel: viewModel,
                    isSelected: viewModel.yearOfAdmission != nil
                ) {
                    withAnimation {
                        showYearPicker = true
                    }
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
    }

    private func gradeButtons() -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("학년")
                    .pretendardFont(.body2_sb_14)
                    .foregroundStyle(.gray08)

                Spacer()
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(GradeState.allCases.indices, id: \.self) { index in
                    SmallButton(
                        text: GradeState.allCases[index].rawValue,
                        isTapped: viewModel.grade == GradeState.allCases[index]
                    ) {
                        viewModel.grade = GradeState.allCases[index]
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    GradeAdmissionYearInputView(viewModel: SignupViewModel(), showYearPicker: .constant(false))
}
