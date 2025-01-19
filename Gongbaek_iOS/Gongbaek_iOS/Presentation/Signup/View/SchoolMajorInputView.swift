//
//  SchoolMajorInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorInputView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var schoolName = ""
    @State var majorName = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: 2)
            
            TitleTextBox(
                title: "학교와 학과를 입력해주세요.",
                subtitle: "프로필에 표시되는 정보로, 언제든 변경할 수 있어요."
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 54)
            .padding(.horizontal, 16)
            .padding(.bottom, 44)
            
            Group {
                SearchTextField(
                    inputText: $schoolName,
                    isButton: true,
                    state: .school
                ) { _ in
                    navigationManager.present(.schoolMajorSearchView($schoolName, .school))
                }
                .padding(.bottom, 24)
                
                SearchTextField(
                    inputText: $majorName,
                    isButton: true,
                    state: .major
                ) { _ in
                    navigationManager.present(.schoolMajorSearchView($majorName, .major))
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            BasicButton(
                text: "다음",
                isActivated: !schoolName.isEmpty && !majorName.isEmpty
            ) {
                navigationManager.push(view: SignupDestination.gradeAdmissionYearInput)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar(showBackButton: true)
    }
}

#Preview {
    SchoolMajorInputView()
}
