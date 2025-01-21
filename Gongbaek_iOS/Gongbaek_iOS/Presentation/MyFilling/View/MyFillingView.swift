//
//  MyFillingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct MyFillingView: View {
    var body: some View {
        MyFillSegmentControlBar()
            .customNavigationBar(title: "나의 채움")
    }
}

#Preview {
    MyFillingView()
}
