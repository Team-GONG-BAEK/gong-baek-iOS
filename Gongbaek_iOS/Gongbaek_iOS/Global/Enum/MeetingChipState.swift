//
//  GroupChipState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum MeetingChipState {
    case recruiting(RecruitingState)
    case category(CategoryState)
    case weekly(GroupState)
}

extension MeetingChipState {
    
    var backgroundColor: Color {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .RECRUITING:
                return .gray08
            case .RECRUITED:
                return .gray06
            case .CLOSED:
                return .gray02
            case .error:
                return .subOrange
            }
        case .category, .weekly:
            return .gray01
        }
    }
    
    var textColor: Color {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .RECRUITING, .RECRUITED:
                return .grayWhite
            case .CLOSED:
                return .gray07
            case .error:
                return .errorRed
            }
        case .category:
            return .mainOrange
        case .weekly(let isWeekly):
            return isWeekly == .WEEKLY ? .subGreen : .subBlue
        }
    }
    
    var titleText: String {
        switch self {
        case .recruiting(let recruitingState):
            switch recruitingState {
            case .RECRUITING:
                return "모집중"
            case .RECRUITED:
                return "인원마감"
            case .CLOSED:
                return "마감"
            case .error:
                return "오류"
            }
        case .category(let categoryState):
            return categoryState.categoryName
        case .weekly(let isWeekly):
            return isWeekly == .WEEKLY ? "매주 보기" : "한번 보기"
        }
    }
}
