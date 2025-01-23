//
//  SplashView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/22/25.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        LottieView(animationName:  "splash", loopMode: .playOnce)
            .ignoresSafeArea(.all)
            .scaledToFill()
    }
}

#Preview {
    SplashView()
}
