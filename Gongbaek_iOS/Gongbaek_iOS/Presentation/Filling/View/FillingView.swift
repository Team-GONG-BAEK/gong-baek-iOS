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
        VStack(spacing: 0) {
            WeekFilterBar()
                .padding(.bottom, 8)
            CategoryBar()
                .padding(.bottom, 8)
            Rectangle()
                .fill(.gray01)
                .frame(height: 8)
            FillingList()
            Spacer()
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    FillingView()
}
