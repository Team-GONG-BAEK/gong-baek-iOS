//
//  ImageMapEnums.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import SwiftUI

enum ProfileDefaultImageMap: Int, CaseIterable {
    case zero = 0
    case one
    case two
    case three
    case four
    case five
    
    var image: ImageResource {
        switch self {
        case .zero:
            return .imgProfileDefault0
        case .one:
            return .imgProfileDefault1
        case .two:
            return .imgProfileDefault2
        case .three:
            return .imgProfileDefault3
        case .four:
            return .imgProfileDefault4
        case .five:
            return .imgProfileDefault5
        }
    }
}

enum ProfileButtonImageMap: Int, CaseIterable {
    case zero = 0
    case one
    case two
    case three
    case four
    case five
    
    var image: ImageResource {
        switch self {
        case .zero:
            return .imgProfileButton0
        case .one:
            return .imgProfileButton1
        case .two:
            return .imgProfileButton2
        case .three:
            return .imgProfileButton3
        case .four:
            return .imgProfileButton4
        case .five:
            return .imgProfileButton5
        }
    }
}
