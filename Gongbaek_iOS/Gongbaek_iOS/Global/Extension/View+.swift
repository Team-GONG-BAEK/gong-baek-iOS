//
//  View+.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

extension View {
    
    func customNavigationBar(
        title: String? = nil,
        viewName: String? = nil,
        showBackButton: Bool = false,
        showXButton: Bool = false,
        onBackButtonTap: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomNavigationBarModifier(
            title: title,
            viewName: viewName,
            showBackButton: showBackButton,
            showXButton: showXButton,
            onBackButtonTap: onBackButtonTap
        ))
    }
}
