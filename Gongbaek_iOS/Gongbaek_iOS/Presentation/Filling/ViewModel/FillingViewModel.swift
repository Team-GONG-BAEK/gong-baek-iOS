//
//  FillingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/16/25.
//

import SwiftUI
import Combine

class FillingViewModel: ObservableObject {
    @Published var isToggleOn: Bool = true
    @Published var selectedCategory: CategoryState = .ALL {
        didSet {
            print("📌 선택된 카테고리 변경됨: \(selectedCategory)")
        }
    }
    
    
}
