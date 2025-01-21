//
//  GroupState.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/21/25.
//

enum GroupState {
    case ONCE
    case WEEKLY
    
    init?(_ serverValue: String?) {
        switch serverValue?.uppercased() {
        case "ONCE":
            self = .ONCE
        case "WEEKLY":
            self = .WEEKLY
        default:
            return nil
        }
    }
}
