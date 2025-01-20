//
//  Double+.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/19/25.
//

import SwiftUI

extension Double {

    func formatTime() -> String {
        let hours = Int(self)
        let minutes = Int((self - Double(hours)) * 60)
        return String(format: "%02d:%02d", hours, minutes)
    }
    
}


