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
            Text("\(viewModel.meetingDetailData?.currentPeopleCount ?? 0) / \(viewModel.meetingDetailData?.maxPeopleCount ?? 0) 명")
                .pretendardFont(.title2_sb_18)
                .padding(16)
                .foregroundStyle(viewModel.isActivated ? .gray01 : .grayWhite)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(viewModel.isActivated ? .gray09 : .gray04)
                )
            
            BasicButton(text: viewModel.buttonText, isActivated: viewModel.isActivated, onTap: viewModel.buttonAction)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}
