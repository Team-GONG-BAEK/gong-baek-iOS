//
//  RecruitingState.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/21/25.
//

enum RecruitingState: String, CaseIterable {
    case RECRUITING
    case RECRUITED
    case CLOSED
    case error
    
    init(from serverValue: String) {
        switch serverValue.uppercased() {
        case "RECRUITING":
            self = .RECRUITING
        case "RECRUITED":
            self = .RECRUITED
        case "CLOSED":
            self = .CLOSED
        default:
            self = .error
        }
    }
}
