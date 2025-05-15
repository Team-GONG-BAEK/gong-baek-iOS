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
    var titleFont: FontFamily {
        switch self {
        case .cell: return .body1_m_16
        case .detail: return .body1_sb_16
        }
    }
    
    var infoFont: FontFamily {
        switch self {
        case .cell: return .caption2_r_12
        case .detail: return .caption2_m_12
        }
    }
    
    var isRecruitingChipVisible: Bool {
        switch self {
        case .cell(.myFill), .detail:
            return true
        default:
            return false
        }
    }
}
