//
//  View+.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

extension View {
    
    func customNavigationBar(
        isMeetingRoom: Bool = false,
        title: String? = nil,
        viewName: String? = nil,
        showBackButton: Bool = false,
        showXButton: Bool = false,
        onBackButtonTap: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomNavigationBarModifier(
            isMeetingRoom: isMeetingRoom, title: title,
            viewName: viewName,
            showBackButton: showBackButton,
            showXButton: showXButton,
            onBackButtonTap: onBackButtonTap
        ))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    // 키보드 숨기기 확장 함수
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
