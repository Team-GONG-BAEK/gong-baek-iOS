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
                    Text(viewModel.meetingDetailData?.introduction ?? "")
                        .pretendardFont(.body2_r_14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                    
                    Text("모집자 프로필")
                        .pretendardFont(.body1_b_16)
                    
                    OwnerProfileBox(viewModel: viewModel)
                    
                    Text(viewModel.ownerInfoData?.introduction ?? "")
                        .pretendardFont(.body2_r_14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray01)
                        )
                        .padding(.bottom, 20)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)

            ApplyBar(viewModel: viewModel)
        }
    }
}
