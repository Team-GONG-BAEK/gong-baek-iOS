//
//  MyPageSettingEnums.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 4/7/25.
//

enum SettingHeaderType: String, CaseIterable {
    case information = "이용 안내"
    case account = "계정"
}

enum SettingItemType {
    case webLink(url: String)
    case info(subtitle: String)
    case action(handler: () -> Void)
}
