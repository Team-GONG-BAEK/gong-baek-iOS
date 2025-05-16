//
//  MeetingInfoView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/18/25.
//

import SwiftUI

struct MeetingInfoView: View {
    @ObservedObject var viewModel: MeetingDetailViewModel
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("소개글")
                        .pretendardFont(.body1_b_16)
                        .foregroundColor(.gray10)
                    Text(viewModel.meetingDetailData?.introduction ?? "")
                        .pretendardFont(.body2_r_14)
                        .foregroundColor(.gray08)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                    
                    Text("모집자 프로필")
                        .pretendardFont(.body1_b_16)
                        .foregroundColor(.gray10)
                    
                    if viewModel.isDeletedHost {
                        deletedOwnerBox()
                    } else {
                        if let data = viewModel.ownerInfoData {
                            OwnerProfileBox(ownerInfoData: data)
                            
                            Text(data.introduction)
                                .pretendardFont(.body2_r_14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.gray01)
                                )
                        }
                    }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            
            ApplyBar(viewModel: viewModel)
        }
    }
    
    private func deletedOwnerBox() -> some View {
        Text("탈퇴한 회원입니다.")
            .pretendardFont(.body2_r_14)
            .foregroundColor(.gray08)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray01)
            )
    }
}
