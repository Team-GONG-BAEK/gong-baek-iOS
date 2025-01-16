//
//  CustomSegmentControl.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: - TODO: enum 분리하기

enum SegmentState {
    case detail
    case myfill
}

enum SegmentDetailType: String, CaseIterable {
    case meetingInfo = "모임정보"
    case comment = "댓글"
}

enum SegmentMyFillType: String, CaseIterable {
    case recruit = "내가 모집한"
    case apply = "내가 신청한"
}

extension SegmentState {
    var titles: [String] {
        switch self {
        case .detail:
            return [
                SegmentDetailType.meetingInfo.rawValue,
                SegmentDetailType.comment.rawValue
            ]
        case .myfill:
            return [
                SegmentMyFillType.recruit.rawValue,
                SegmentMyFillType.apply.rawValue
            ]
        }
    }
    
    @ViewBuilder
    func view(at index: Int) -> some View {
        switch self {
        case .detail:
            switch SegmentDetailType.allCases[index] {
            case .meetingInfo: Color.gray03
            case .comment: Color.gray04
            }
        case .myfill:
            switch SegmentMyFillType.allCases[index] {
            case .recruit: Color.gray03
            case .apply: Color.gray04
            }
        }
    }
}

struct SegmentControlBar: View {
    let segmentState: SegmentState
    @State var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(segmentState.titles.indices, id: \.self) { segmentIndex in
                    Button {
                        selectedIndex = segmentIndex
                    } label: {
                        ZStack(alignment: .bottom) {
                            Text(segmentState.titles[segmentIndex])
                                .pretendardFont(.body1_m_16)
                                .foregroundColor(selectedIndex == segmentIndex ? .gray10 : .gray05)
                                .padding(.vertical, 15)
                            
                            selectedIndex == segmentIndex
                            ? Color(.gray09).frame(height: 2)
                            : Color(.gray02).frame(height: 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.grayWhite)
                }
            }
            segmentState.view(at: selectedIndex)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    SegmentControlBar(segmentState: .detail)
    SegmentControlBar(segmentState: .myfill)
}

