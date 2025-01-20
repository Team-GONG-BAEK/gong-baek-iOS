//
//  Sex.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/21/25.
//

enum Sex {
    case MAN
    case WOMAN
    case error
    
    init(from serverValue: String) {
        switch serverValue.uppercased() {
        case "MAN":
            self = .MAN
        case "WOMAN":
            self = .WOMAN
        default:
            self = .MAN
        }
    }
}

/*
 init(from serverValue: String?) {
         self = Sex(rawValue: serverValue.uppercased()) ?? .MALE // 기본값 male
     }
 */
