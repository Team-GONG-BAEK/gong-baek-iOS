//
//  SchoolEmailVerificationView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 4/3/25.
//

import SwiftUI

struct SchoolEmailVerificationView: View {
    @ObservedObject var viewModel: SignupViewModel
    @State private var isTimerVisible: Bool = false
    
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
                    // response 받으면 3분 타이머 시작
                    viewModel.startTimer()
                    isTimerVisible = true
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
                    .keyboardType(.numberPad)
                    .overlay(
                        GeometryReader { proxy in
                            timer(proxy)
                        }
                    )
                
                blackButton(title: "인증하기") {
                    // TODO: 뷰모델 API 호출
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    private func blackButton(
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
    
    private func timer(_ proxy: GeometryProxy) -> some View {
        Text(viewModel.formattedTime(viewModel.remainingTime))
            .pretendardFont(.caption2_r_12)
            .foregroundStyle(.errorRed)
            .frame(height: 18)
            .position(
                x: proxy.size.width - 16 - 15,
                y: proxy.size.height - 48 / 2
            )
            .opacity(isTimerVisible ? 1 : 0)
    }
}

#Preview {
    let viewModel = SignupViewModel()
    viewModel.schoolName = "건국대학교"
    viewModel.emailStatus = .codeSent
    viewModel.verificationStatus = .invalidCode
    
    return SchoolEmailVerificationView(viewModel: viewModel)
}
