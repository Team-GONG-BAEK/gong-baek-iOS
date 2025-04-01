//
//  MyPageSettingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/2/25.
//

import SwiftUI

enum SettingHeaderType: String, CaseIterable {
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

struct MyPageSettingStatus: Identifiable {
    let id: UUID = UUID()
    let header: SettingHeaderType
    let items: [SettingItem]
}

extension MyPageSettingStatus {
    static let settingList: [MyPageSettingStatus] = [
        MyPageSettingStatus(
            header: .information,
            items: [
                SettingItem(title: "공지사항", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280a9805df2e84a4ae342")),
                SettingItem(title: "개인정보 처리방침", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f428057ad33e49f07f6125a")),
                SettingItem(title: "서비스 이용 약관", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280fc8dabdb19fff63765")),
                SettingItem(title: "버전 정보", type: .info(subtitle: "1.1.1"))
            ]
        ),
        MyPageSettingStatus(
            header: .account,
            items: [
                SettingItem(title: "로그아웃", type: .action {
                    print("로그아웃 실행됨") //TODO: 로그아웃 수행 코드 추가
                }),
                SettingItem(title: "회원탈퇴", type: .action {
                    print("회원탈퇴 실행됨") //TODO: 회원탈퇴 수행 코드 추가
                })
            ]
        )
    ]
}
