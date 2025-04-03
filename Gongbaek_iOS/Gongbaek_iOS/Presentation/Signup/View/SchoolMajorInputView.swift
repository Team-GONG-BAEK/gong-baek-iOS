//
//  SchoolMajorInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    @Binding var showYearPicker: Bool
    let onTapSchoolSearchButton: (() -> Void)?
    let onTapMajorSearchButton: (() -> Void)?
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TitleTextBox(
                    title: "학교와 학과를 입력해주세요.",
                    subtitle: "프로필에 표시되는 정보로, 언제든 변경할 수 있어요."
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
    SchoolMajorInputView(
        viewModel: SignupViewModel(),
        showYearPicker: .constant(false),
        onTapSchoolSearchButton: {},
        onTapMajorSearchButton: {}
    )
}
