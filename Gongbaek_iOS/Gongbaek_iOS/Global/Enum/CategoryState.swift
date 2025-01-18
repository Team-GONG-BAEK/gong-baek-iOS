//
//  CategoryState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

enum CategoryState: Int, CaseIterable {
    case all = 0
    case study = 1
    case dining = 2
    case sport = 3
    case networking = 4
    case play = 5
    case others = 6
    
    //TODO: 일러스트 이미지 추가
    var categoryImage: String? {
        switch self {
        case .all: return nil
        case .study: return "sample"
        case .dining: return "sample"
        case .sport: return "sample"
        case .networking: return "sample"
        case .play: return "sample"
        case .others: return "sample"
        }
    }
    
    var categoryName: String {
        switch self {
        case .all: return "전체"
        case .study: return "스터디"
        case .dining: return "식사"
        case .sport: return "운동/산책"
        case .networking: return "네트워킹"
        case .play: return "놀기"
        case .others: return "기타"
        }
    }
    
    var coverImage: [String] {
           switch self {
           case .all: return []
           case .study: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           case .dining: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           case .sport: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           case .networking: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           case .play: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           case .others: return ["sample", "sample", "sample", "sample", "sample", "sample"]
           }
       }
}
