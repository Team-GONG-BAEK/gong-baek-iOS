//
//  MeetingInfoState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum MeetingInfoState {
    case cell(FillItemState)
    case detail
    
    enum FillItemState {
        case fill
        case myFill
    }
}

extension MeetingInfoState {
    var titleFont: Font {
        switch self {
        case .cell: return .pretendard(.body1_m_16)
        case .detail: return .pretendard(.body1_sb_16)
        }
    }
    
    var infoFont: Font {
        switch self {
        case .cell: return .pretendard(.caption2_r_12)
        case .detail: return .pretendard(.caption2_m_12)
        }
    }
    
    var showRecruitingChip: Bool {
        switch self {
        case .cell(.myFill), .detail:
            return true
        default:
            return false
        }
    }

    
}
