//
//  MypageSettingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/2/25.
//

import SwiftUI

enum SettingSection: String, CaseIterable {
    case information = "이용 안내"
    case account = "계정"
}

struct SettingItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let type: SettingItemType
}

enum SettingItemType {
    case webLink(url: String) // Link로 연결
    case info(subtitle: String?) // 정보만 보이는 용도
    case action(handler: () -> Void) // button 역할
}

struct SettingSectionModel: Identifiable {
    let id: UUID = UUID()
    let section: SettingSection
    let items: [SettingItem]
}

extension SettingSectionModel {
    
    static let sampleData: [SettingSectionModel] = [
        SettingSectionModel(
            section: .information,
            items: [
                SettingItem(title: "공지사항", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280a9805df2e84a4ae342")),
                SettingItem(title: "개인정보 처리방침", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f428057ad33e49f07f6125a")),
                SettingItem(title: "서비스 이용 약관", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280fc8dabdb19fff63765")),
                SettingItem(title: "버전 정보", type: .info(subtitle: "1.1.1"))
            ]
        ),
        SettingSectionModel(
            section: .account,
            items: [
                SettingItem(title: "로그아웃", type: .action {
                    print("로그아웃 실행됨")
                }),
                SettingItem(title: "회원탈퇴", type: .action {
                    print("회원탈퇴 실행됨")
                })
            ]
        )
    ]
}
