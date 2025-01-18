//
//  MyFillSegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

enum MyFillType: String, CaseIterable {
    case recruit = "내가 모집한"
    case apply = "내가 신청한"
}

struct MyFillSegmentControlBar: View {
    //@Binding var recruit의binding될_데이터: binding될_데이터
    //@Binding var apply의binding될_데이터: binding될_데이터
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(MyFillType.allCases.indices, id: \.self) { index in
                    let type = MyFillType.allCases[index]
                    let isSelected = selectedIndex == index

                    Button {
                        selectedIndex = index
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(type.rawValue)
                                .pretendardFont(.body1_m_16)
                                .foregroundColor(isSelected ? .gray10 : .gray05)
                                .padding(.vertical, 15)
                            
                            selectedIndex == index ?
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
    }
    
    @ViewBuilder
    private func selectedView() -> some View {
        let type = MeetingDetailType.allCases[selectedIndex]
        switch type {
        case .meetingInfo:
            Color.black//MeetingInfoView(ownerInfo: $ownerInfo, meetingDetail: $meetingDetailData)
        case .comment:
            Color.gray02 //CommentView(commentData: dummyCommentData)
        }
    }
}

#Preview {
    MyFillSegmentControlBar()
}
