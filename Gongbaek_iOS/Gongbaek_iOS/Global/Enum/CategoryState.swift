//
//  CategoryState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum CategoryState: Int, CaseIterable {
    case ALL = 0
    case STUDY = 1
    case DINING = 2
    case EXERCISE = 3
    case NETWORKING = 4
    case PLAYING = 5
    case OTHERS = 6
    
    init?(_ serverValue: String?) {
        switch serverValue?.uppercased() {
        case "ALL":
            self = .ALL
        case "STUDY":
            self = .STUDY
        case "DINING":
            self = .DINING
        case "EXERCISE":
            self = .EXERCISE
        case "NETWORKING":
            self = .NETWORKING
        case "PLAYING":
            self = .PLAYING
        case "OTHERS":
            self = .OTHERS
        default:
            return nil
        }
    }
    
    var categoryImage: Image? {
        switch self {
        case .ALL: return nil
        case .STUDY: return Image(.imgCategoryStudy)
        case .DINING: return Image(.imgCategoryDining)
        case .EXERCISE: return Image(.imgCategoryExercise)
        case .NETWORKING: return Image(.imgCategoryNetworking)
        case .PLAYING: return Image(.imgCategoryPlay)
        case .OTHERS: return Image(.imgCategoryOthers)
        }
    }
    
    var categoryName: String {
        switch self {
        case .ALL: return "전체"
        case .STUDY: return "스터디"
        case .DINING: return "식사"
        case .EXERCISE: return "운동/산책"
        case .NETWORKING: return "네트워킹"
        case .PLAYING: return "취미/오락"
        case .OTHERS: return "기타"
        }
    }
    
    var coverImage: [String] {
        switch self {
        case .ALL: return []
        case .STUDY: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        case .DINING: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        case .EXERCISE: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        case .NETWORKING: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        case .PLAYING: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        case .OTHERS: return ["sample", "sample", "sample", "sample", "sample", "sample"]
        }
    }
}
