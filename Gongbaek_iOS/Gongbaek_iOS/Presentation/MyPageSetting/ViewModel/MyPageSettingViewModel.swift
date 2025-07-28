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
    @Published var isSignedOut: Bool = false

    func performAction(_ action: SettingActionType) {
        selectedAction = action
        showAlert = true
    }
    
    func confirmAction() {
        guard let action = selectedAction else { return }
        
        switch action {
        case .logout:
            deleteLogout { [weak self] success in
                guard let self = self else { return }
                self.handleSignOut(success: success)
            }
        case .deleteAccount:
            deleteWidthdraw { [weak self] success in
                guard let self = self else { return }
                self.handleSignOut(success: success)
            }
        }
        
        self.selectedAction = nil
    }
}

extension MyPageSettingViewModel {
    
    func handleSignOut(success: Bool) {
        if success {
            TokenManager.shared.clearAll()
            DispatchQueue.main.async {
                self.isSignedOut = true
            }
        } else {
            self.isSignedOut = false
        }
    }
    
    // 로그아웃 서버 통신
    func deleteLogout(completion: @escaping (Bool) -> Void) {
        Providers.authProvider.request(
            target: .deleteLogout,
            instance: BaseResponse<VoidResult>.self
        ) { response in
            
            guard response.success else {
                print("로그아웃 실패! \(response.message ?? "알 수 없음")")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    // 회원탈퇴 서버 통신
    func deleteWidthdraw(completion: @escaping (Bool) -> Void) {
        Providers.authProvider.request(
            target: .deleteWithdraw,
            instance: BaseResponse<VoidResult>.self
        ) { response in
            
            guard response.success else {
                print("회원탈퇴 실패! \(response.message ?? "알 수 없음")")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
}
