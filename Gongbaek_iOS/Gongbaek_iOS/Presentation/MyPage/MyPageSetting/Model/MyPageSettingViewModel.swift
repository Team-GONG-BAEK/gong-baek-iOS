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

    func performAction(_ action: SettingActionType) {
        selectedAction = action
        showAlert = true
    }

    func confirmAction() {
        guard let action = selectedAction else { return }

        switch action {
        case .logout:
            print("로그아웃 처리")

        case .deleteAccount:
            print("회원탈퇴 처리")
        }

        selectedAction = nil
        showAlert = false
    }
}
