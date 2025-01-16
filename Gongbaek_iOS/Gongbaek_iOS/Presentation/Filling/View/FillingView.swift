//
//  FillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

struct FillingView: View {
    @StateObject var viewModel = FillingViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 8) {
                WeekFilterBar()
                CategoryBar(viewModel: viewModel)
                Rectangle()
                    .fill(.gray01)
                    .frame(height: 8)
            }
            
            HStack(spacing: 6) {
                CycleButton(state: .all)
                    .disabled(true)
                Spacer()
                Text(viewModel.isToggleOn ? "겹치는 공백" : "모든 공백")
                    .font(.pretendard(.caption2_r_12))
                    .foregroundColor(.gray06)
                ToggleButton(isOn: $viewModel.isToggleOn, isDisabled: true)
            }
            .padding(.horizontal, 16)
            FillingList()
            Spacer()
        }
    }
}

#Preview {
    FillingView()
}
