//
//  MypageSettingView.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 3/25/25.
//

import SwiftUI

struct MypageSettingView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(SettingSectionModel.sampleData) { sectionModel in
                SettingHeaderCell(type: sectionModel.section)

                ForEach(sectionModel.items) { item in
                    settingCell(for: item)
                }

                if sectionModel.section == .information {
                    Color(.gray01).frame(height: 8)
                }
            }
            Spacer()
        }
    }
}

extension MypageSettingView {
    @ViewBuilder
    func settingCell(for item: SettingItem) -> some View {
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
