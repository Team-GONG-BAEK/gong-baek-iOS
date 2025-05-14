//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

struct ApplyBar: View {
    @ObservedObject var viewModel: MeetingDetailViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            if let data = viewModel.meetingDetailData {
                Text("\(data.currentPeopleCount) / \(data.maxPeopleCount) 명")
                    .pretendardFont(.title2_sb_18)
                    .padding(16)
                    .foregroundStyle(viewModel.isActivated(for: data) ? .gray01 : .grayWhite)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(viewModel.isActivated(for: data) ? .gray09 : .gray04)
                    )
                
                BasicButton(
                    text: viewModel.buttonText(for: data),
                    isActivated: viewModel.isActivated(for: data),
                    onTap: viewModel.buttonAction(for: data)
                )
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}
