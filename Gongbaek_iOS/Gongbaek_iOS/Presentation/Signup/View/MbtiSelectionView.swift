//
//  MbtiSelectionView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct MbtiSelectionView: View {
    @ObservedObject var viewModel: SignupViewModel
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            TitleTextBox(
                title: "MBTI를 선택해주세요.",
                subtitle: "자신의 성향을 잘 나타내는 MBTI를 선택해 주세요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            
            ScrollView {
                VStack(spacing: 28) {
                    mbtiButtons(type: .ei)
                    mbtiButtons(type: .sn)
                    mbtiButtons(type: .tf)
                    mbtiButtons(type: .jp)
                    Spacer()
                }
                .padding(.top, 44)
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.never)
            
            Spacer()
        }
    }
    
    private func mbtiButtons(type: MBTI) -> some View {
        VStack(spacing: 0) {
            mbtiText(text: type.text)
            
            LazyVGrid(columns: columns) {
                switch type {
                case .ei:
                    ForEach(MBTI_ei.allCases.indices, id: \.self) { index in
                        SmallButton(
                            text: MBTI_ei.allCases[index].rawValue,
                            isTapped: viewModel.e_i == MBTI_ei.allCases[index]
                        ) {
                            viewModel.e_i = MBTI_ei.allCases[index]
                        }
                    }
                case .sn:
                    ForEach(MBTI_sn.allCases.indices, id: \.self) { index in
                        SmallButton(
                            text: MBTI_sn.allCases[index].rawValue,
                            isTapped: viewModel.s_n == MBTI_sn.allCases[index]
                        ) {
                            viewModel.s_n = MBTI_sn.allCases[index]
                        }
                    }
                case .tf:
                    ForEach(MBTI_tf.allCases.indices, id: \.self) { index in
                        SmallButton(
                            text: MBTI_tf.allCases[index].rawValue,
                            isTapped: viewModel.t_f == MBTI_tf.allCases[index]
                        ) {
                            viewModel.t_f = MBTI_tf.allCases[index]
                        }
                    }
                case .jp:
                    ForEach(MBTI_jp.allCases.indices, id: \.self) { index in
                        SmallButton(
                            text: MBTI_jp.allCases[index].rawValue,
                            isTapped: viewModel.j_p == MBTI_jp.allCases[index]
                        ) {
                            viewModel.j_p = MBTI_jp.allCases[index]
                        }
                    }
                }
            }
        }
    }
    
    private func mbtiText(text: String) -> some View {
        HStack {
            Text(text)
                .pretendardFont(.body2_sb_14)
                .foregroundStyle(.gray08)
            Spacer()
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    MbtiSelectionView(viewModel: SignupViewModel())
}
