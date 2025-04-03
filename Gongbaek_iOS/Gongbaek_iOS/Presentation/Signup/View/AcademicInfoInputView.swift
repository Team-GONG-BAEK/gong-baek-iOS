//
//  AcademicInfoInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct AcademicInfoInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    @Binding var showYearPicker: Bool
    let onTapSchoolSearchButton: (() -> Void)?
    let onTapMajorSearchButton: (() -> Void)?
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TitleTextBox(
                    title: "학적정보를 입력해주세요.",
                    subtitle: "자신의 학교와 학과, 입학연도를 선택해주세요."
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 44)
                
                Group {
                    SearchTextField(
                        inputText: $viewModel.schoolName,
                        isButton: true,
                        state: .school
                    ) { _ in
                        onTapSchoolSearchButton?()
                    }
                    .padding(.bottom, 24)
                    
                    SearchTextField(
                        inputText: $viewModel.majorName,
                        isButton: true,
                        state: .major
                    ) { _ in
                        onTapMajorSearchButton?()
                    }
                    
                }
                .padding(.horizontal, 16)
                
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
}

#Preview {
    AcademicInfoInputView(
        viewModel: SignupViewModel(),
        showYearPicker: .constant(false),
        onTapSchoolSearchButton: {},
        onTapMajorSearchButton: {}
    )
}
