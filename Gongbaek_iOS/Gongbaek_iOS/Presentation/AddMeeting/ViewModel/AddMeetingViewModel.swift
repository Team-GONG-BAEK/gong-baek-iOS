//
//  AddMeetingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

class AddMeetingViewModel: ObservableObject {
    let totalSteps: Int = 8
    @Published var currentIndex: Int = 0
    @Published var isNextEnabled: Bool = false
    
    @Published var selectedWeekDate: Date? = nil
    @Published var selectedWeekDay: String? = nil
    @Published var selectedCycle: CycleState? = nil
    @Published var selectedCategory: CategoryState? = nil
    @Published var selectedCoverImage: String? = nil
    
    func goToNextPage() {
        guard isNextEnabled else { return }
        
        if currentIndex == 0 {
            currentIndex = 1
        } else {
            currentIndex += 1 
        }
        isNextEnabled = false
    }

}
