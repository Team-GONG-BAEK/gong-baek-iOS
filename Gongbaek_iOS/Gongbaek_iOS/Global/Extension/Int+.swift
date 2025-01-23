//
//  Int+.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/23/25.
//

import SwiftUI

extension Int {
    
    func removeComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none 
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
}
