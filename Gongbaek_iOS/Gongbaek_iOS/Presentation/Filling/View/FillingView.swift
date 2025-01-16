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
        }
    }
}

#Preview {
    FillingView()
}
