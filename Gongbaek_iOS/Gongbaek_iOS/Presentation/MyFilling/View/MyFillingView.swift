//
//  MyFillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyFillingView: View {
    @ObservedObject var viewModel: MyFillingViewModel
    
    var body: some View {
        ZStack {
            MyFillSegmentControlBar(viewModel: MyFillingViewModel())

            if viewModel.showAlert {
                FullErrorView(onTapRetryButton: {
                    viewModel.showAlert = false
                    viewModel.getMeetings()
                })
            }
        }
        .customNavigationBar(title: "나의 채움")
    }
}

#Preview {
    MyFillingView(viewModel: MyFillingViewModel())
}
