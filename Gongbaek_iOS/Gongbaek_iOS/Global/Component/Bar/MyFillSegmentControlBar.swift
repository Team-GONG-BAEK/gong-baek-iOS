//
//  MyFillSegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

enum MyFillingType: String, CaseIterable {
    case register = "내가 모집한"
    case apply = "내가 신청한"
}

enum MyFillingCategory: String, CaseIterable {
    case register = "REGISTER"
    case apply = "APPLY"
}

struct MyFillSegmentControlBar: View {
    @ObservedObject var viewModel: MyFillingViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(MyFillingCategory.allCases, id: \.self) { category in
                    let isSelected = viewModel.selectedCategory == category
                    
                    Button {
                        viewModel.selectedCategory = category
                        viewModel.getMeetings()
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(category == .register ? "내가 모집한" : "내가 신청한") 
                                .pretendardFont(.body1_m_16)
                                .foregroundColor(isSelected ? .gray10 : .gray05)
                                .padding(.vertical, 15)
                            
                            isSelected ?
                            Color(.gray09).frame(height: 2) :
                            Color(.gray02).frame(height: 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                }
            }
            selectedView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            viewModel.getMeetings()
        }
        .onChange(of: viewModel.selectedCategory) {
            viewModel.getMeetings()
        }
    }
    
    @ViewBuilder
    private func selectedView() -> some View {
        MyFillingList(viewModel: viewModel)
    }
}
