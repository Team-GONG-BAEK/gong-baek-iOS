//
//  SchoolEmailVerificationView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/3/25.
//

import SwiftUI

struct SchoolEmailVerificationView: View {
    @ObservedObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                TitleTextBox(title: viewModel.schoolName)
                    .padding(.top, 54)
                TitleTextBox(title: "이메일로 인증해주세요.")
                    .padding(.bottom, 44)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .bottom, spacing: 8) {
                CustomTextFieldWithStatus<TextFieldType.EmailStatus>(
                    text: $viewModel.email,
                    status: $viewModel.emailStatus,
                    type: .schoolEmail
                )
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                
                blackButton(title: "코드받기") {
                    // TODO: 뷰모델 API 호출
                }
            }
            .padding(.bottom, 34)
            
            HStack(alignment: .bottom, spacing: 8) {
                CustomTextFieldWithStatus<TextFieldType.VerificationStatus>(
                    text: $viewModel.verificationCode,
                    status: $viewModel.verificationStatus,
                    type: .verificationCode
                )
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                
                blackButton(title: "인증하기") {
                    // TODO: 뷰모델 API 호출
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    func blackButton(
        title: String,
        onTap: @escaping () -> Void
    ) -> some View {
        Button(action: {
            onTap()
        }, label: {
            Text(title)
                .pretendardFont(.body1_m_16)
                .padding(.horizontal, 11.5)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(.gray10)
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
        })
    }
}

#Preview {
    let viewModel = SignupViewModel()
    viewModel.schoolName = "건국대학교"
    viewModel.emailStatus = .codeSent
    viewModel.verificationStatus = .invalidCode
    
    return SchoolEmailVerificationView(viewModel: viewModel)
}
