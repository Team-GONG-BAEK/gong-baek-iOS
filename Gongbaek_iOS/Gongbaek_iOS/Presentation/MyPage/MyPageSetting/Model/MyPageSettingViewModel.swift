//
//  MyPageSettingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/2/25.
//

import SwiftUI

final class MyPageSettingViewModel: ObservableObject {
    @Published var settingSections: [MyPageSettingSection] = MyPageSettingSection.settingList
    @Published var showAlert: Bool = false
    @Published var selectedAction: SettingActionType?
    @Published var isLogout: Bool = false

    func performAction(_ action: SettingActionType) {
        selectedAction = action
        showAlert = true
    }

    func confirmAction() {
        guard let action = selectedAction else { return }

        switch action {
        case .logout:
            print("로그아웃 처리")
            // 1. 키체인에 저장된 토큰 지우기
            TokenManager.shared.clearAll()
            
            // 2. 뷰에서 로그아웃 감지하도록 설정 -> 뷰에서 로그인 뷰로 화면 전환
            isLogout = true
        case .deleteAccount:
            print("회원탈퇴 처리")
        }

        selectedAction = nil
        showAlert = false
    }
}
