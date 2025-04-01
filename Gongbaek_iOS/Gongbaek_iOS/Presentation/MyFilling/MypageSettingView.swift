//
//  MypageSettingView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/25/25.
//

import SwiftUI

struct SettingSectionModel: Identifiable {
    let id: UUID = UUID()
    let section: SettingSection
    let items: [SettingItem]
}

enum SettingSection: String, CaseIterable {
    case information = "이용 안내"
    case account = "계정"
}

enum SettingItemType {
    case webLink(url: String) // Link로 연결
    case info(subtitle: String?) // 정보만 보이는 용도
    case action(handler: () -> Void) // button 역할
}

struct SettingItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let type: SettingItemType
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

struct MypageSettingView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SettingSectionModel.sampleData) { sectionModel in
                SettingHeaderCell(type: sectionModel.section)

                ForEach(sectionModel.items) { item in
                    settingRow(for: item)
                }

                if sectionModel.section == .information {
                    Color(.gray01)
                        .frame(height: 8)
                }
            }
            Spacer()
        }
    }

    @ViewBuilder
    func settingRow(for item: SettingItem) -> some View {
        switch item.type {
        case .webLink(let urlString):
            if let url = URL(string: urlString) {
                Link(destination: url) {
                    SettingBasicCell(title: item.title, type: item.type)
                }
            }
            
        case .info:
            SettingBasicCell(title: item.title, type: item.type)
            
        case .action(let handler):
            Button {
                handler()
            } label: {
                SettingBasicCell(title: item.title, type: item.type)
            }
        }
    }
}

#Preview {
    MypageSettingView()
}
