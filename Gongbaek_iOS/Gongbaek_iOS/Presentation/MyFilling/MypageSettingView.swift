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
            SettingBasicCell(title: "공지사항", bodyText: nil)
            SettingBasicCell(title: "개인정보 처리방침", bodyText: nil)
            SettingBasicCell(title: "서비스 이용 약관", bodyText: nil)
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
