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
            // 1. 로그아웃 서버 통신
            deleteLogout { [weak self] success in
                guard let self = self else { return }
                if success {
                    print("로그아웃 성공")
                    TokenManager.shared.clearAll()
                    DispatchQueue.main.async {
                        self.isLogout = true // 뷰에서 감지해서 화면 전환
                    }
                } else {
                    self.isLogout = false
                }
            }
        case .deleteAccount:
            print("회원탈퇴 처리")
            // 1. 회원탈퇴 서버 통신
            deleteWidthdraw { [weak self] success in
                guard let self = self else { return }
                if success {
                    print("회원탈퇴 성공")
                    TokenManager.shared.clearAll()
                    DispatchQueue.main.async {
                        self.isLogout = true // 뷰에서 감지해서 화면 전환
                    }
                } else {
                    self.isLogout = false
                }
            }
        }
        
        selectedAction = nil
        showAlert = false
    }
}

extension MyPageSettingViewModel {
    
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
    
    func deleteWidthdraw(completion: @escaping (Bool) -> Void) {
        Providers.authProvider.request(
            target: .deleteWidthdraw,
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
