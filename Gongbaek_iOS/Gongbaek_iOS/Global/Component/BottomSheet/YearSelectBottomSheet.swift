//
//  YearSelectBottomSheet.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/23/25.
//

import SwiftUI

struct YearSelectBottomSheet: View {
    @ObservedObject var viewModel: SignupViewModel
    @Environment(\.dismiss) private var dismiss

    private let currentYear = Calendar.current.component(.year, from: Date())

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.grayBlack.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismiss()
                }

            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(height: 16)
                    .padding(.top, -16)

                HStack {
                    Text("입학년도 선택")
                        .pretendardFont(.title2_sb_18)
                        .padding(.top, 48)
                        .padding(.bottom, 18)
                    Spacer()
                }
                
                Picker("연도", selection: $viewModel.yearOfAdmission) {
                    ForEach((2000...currentYear).reversed(), id: \.self) { year in
                        Text("\(year.removeComma())년")
                            .pretendardFont(.head2_r_24)
                            .foregroundColor(.grayBlack)
                            .tag(year)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 180)
                .padding(.bottom, 18)
                .padding(.horizontal, 22)

                BasicButton(text: "선택") {
                    dismiss()
                }
                .padding(.vertical, 20)
                .padding(.bottom, 32)
            }
            .padding(.horizontal, 16)
            .background(.grayWhite)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .presentationDragIndicator(.visible)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


