//
//  SchoolMajorSearchView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorSearchView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    let state: SearchViewState
    
    var body: some View {
        Text("검색화면임")
            .customNavigationBar(title: "검색하기", showXButton: true)
    }
}

#Preview {
    SchoolMajorSearchView(state: .school)
}
