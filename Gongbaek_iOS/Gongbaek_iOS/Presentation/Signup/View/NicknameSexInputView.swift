//
//  NicknameSexInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct NicknameSexInputView: View {
    @ObservedObject var viewModel: SignupViewModel
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            TitleTextBox(
                title: "닉네임과 성별을 입력해주세요.",
                subtitle: "닉네임은 최대 8자 이내로 입력할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            CustomTextFieldWithStatus(
                text: $viewModel.nickname,
                status: $viewModel.nicknameStatus,
                type: .nickname
            )
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding(.horizontal, 16)
            
            sexButtons()
            
            Spacer()
        }
    }
    
    private func sexButtons() -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("성별")
                    .pretendardFont(.body2_sb_14)
                    .foregroundStyle(.gray08)
                
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)
            
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(SexType.allCases.indices, id: \.self) { index in
                    SmallButton(
                        text: SexType.allCases[index].text,
                        isTapped: viewModel.sex == SexType.allCases[index]
                    ) {
                        viewModel.sex = SexType.allCases[index]
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.top, 24)
    }
}

#Preview {
    NicknameSexInputView(viewModel: SignupViewModel())
}
