//
//  SegmentControlBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI


// MARK: - TODO: enum 분리하기

enum ControlType {
    case detail
    case myfill
}

extension ControlType {
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
    let controlType: ControlType
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            CustomSegmentControl(segments: controlType.titles, selected: $selectedIndex)
            Spacer()
        }
        .background(.gray05)
    }
}

#Preview {
    SegmentControlBar(controlType: .detail)
    SegmentControlBar(controlType: .myfill)
}
