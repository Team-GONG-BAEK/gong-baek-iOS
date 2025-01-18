//
//  AddMeetingView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingView: View {
    @State var currentIndex: Int = 0
    var body: some View {
        VStack {
            ProgressBar(currentIndex: $currentIndex)
                .padding(.bottom, 40)
            
            switch currentIndex {
            case 0:
                CycleSelect()
            case 1:
                CycleSelect()
            case 2:
                CycleSelect()
            case 3:
                CycleSelect()
            case 4:
                CycleSelect()
            default:
                Text("잘못된 단계입니다.")
            }
            Spacer()
            BasicButton(text: "다음")
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AddMeetingView()
}
