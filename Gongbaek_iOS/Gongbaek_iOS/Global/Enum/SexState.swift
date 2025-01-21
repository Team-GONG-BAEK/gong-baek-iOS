//
//  Sex.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/21/25.
//

enum SexState {
    case MAN
    case WOMAN
    case error
    
    init(_ serverValue: String) {
        switch serverValue.uppercased() {
        case "MAN":
            self = .MAN
        case "WOMAN":
            self = .WOMAN
        default:
            self = .error
        }
    }
}
