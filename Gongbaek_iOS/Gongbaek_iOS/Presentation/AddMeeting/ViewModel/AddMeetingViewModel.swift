//
//  AddMeetingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

class AddMeetingViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    let totalSteps: Int = 8
    
    func goToNextPage() {
        if currentIndex < totalSteps - 1 {
            currentIndex += 1
        }
    }
    
}
