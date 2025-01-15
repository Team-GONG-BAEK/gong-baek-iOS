//
//  SearchTextFieldState.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI

enum SearchTextFieldState {
    case school
    case major
}

extension SearchTextFieldState {
    var titleText: String {
        switch self {
        case .school: return "학교"
        case .major: return "학과"
        }
    }
}

