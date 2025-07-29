//
//  MyPageSettingModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 4/7/25.
//

import Foundation

struct SettingItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let type: SettingItemType
}

struct MyPageSettingSection: Identifiable {
    let id: UUID = UUID()
    let header: SettingHeaderType
    let items: [SettingItem]
}

extension MyPageSettingSection {
    static let settingList: [MyPageSettingSection] = [
        MyPageSettingSection(
            header: .information,
            items: [
                SettingItem(title: "공지사항", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280a9805df2e84a4ae342")),
                SettingItem(title: "문의하기", type: .webLink(url: "https://tally.so/r/mZQ9N5")),
                SettingItem(title: "개인정보 처리방침", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f428057ad33e49f07f6125a")),
                SettingItem(title: "서비스 이용 약관", type: .webLink(url: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280fc8dabdb19fff63765")),
                SettingItem(title: "버전 정보", type: .info(subtitle: "1.0.0"))
            ]
        ),
        MyPageSettingSection(
            header: .account,
            items: [
                SettingItem(title: "로그아웃", type: .action(type: .logout)),
                SettingItem(title: "회원탈퇴", type: .action(type: .deleteAccount))
            ]
        )
    ]
}
