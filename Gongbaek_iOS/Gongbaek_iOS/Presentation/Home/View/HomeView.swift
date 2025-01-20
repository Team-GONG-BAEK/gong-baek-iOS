//
//  HomeView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/18/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        Text("홈")
    }
}

#Preview {
    HomeView()
}
