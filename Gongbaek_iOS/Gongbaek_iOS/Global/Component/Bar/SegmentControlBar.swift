//
//  SegmentControlBar.swift
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

extension SegmentState {
    var titles: [String] {
        switch self {
        case .detail:
            return ["모임정보", "댓글"]
        case .myfill:
            return ["내가 모집한", "내가 신청한"]
        }
    }
}

struct SegmentControlBar: View {
    let segmentState: SegmentState
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            CustomSegmentControl(segments: segmentState.titles, selected: $selectedIndex)
            Spacer()
        }
        .background(.gray05)
    }
}

#Preview {
    SegmentControlBar(segmentState: .detail)
    SegmentControlBar(segmentState: .myfill)
}
