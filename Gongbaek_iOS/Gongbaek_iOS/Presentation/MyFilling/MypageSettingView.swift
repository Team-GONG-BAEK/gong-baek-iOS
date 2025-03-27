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
            SettingHeaderCell(title: "이용 안내")

            Link(destination: URL(string: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280a9805df2e84a4ae342")!) {
                            SettingBasicCell(title: "공지사항", bodyText: nil)
                        }
            Link(destination: URL(string: "https://booming-jasmine-4c1.notion.site/1b34c7511f428057ad33e49f07f6125a")!) {
                SettingBasicCell(title: "개인정보 처리방침", bodyText: nil)
            }
            Link(destination: URL(string: "https://booming-jasmine-4c1.notion.site/1b34c7511f4280fc8dabdb19fff63765")!) {
                SettingBasicCell(title: "서비스 이용 약관", bodyText: nil)
            }
            
            SettingBasicCell(title: "버전 정보", bodyText: "1.1.1")
            
            Color(.gray01)
                .frame(maxWidth: .infinity)
                .frame(height: 8)
            
            SettingHeaderCell(title: "계정")
            SettingBasicCell(title: "로그아웃", bodyText: nil)
            SettingBasicCell(title: "회원탈퇴", bodyText: nil)
            
            Spacer()
        }
    }
}

#Preview {
    MypageSettingView()
}
