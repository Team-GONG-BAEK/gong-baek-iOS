//
//  ClassTimeTableInputView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/20/25.
//

import SwiftUI

struct ClassTimeTableInputView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var selectedCells: Set<TimeTableCellId> = []
    @State var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    private let hours = Array(stride(from: 9, through: 17.5, by: 0.5))
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressBar(currentIndex: 7)
            
            // TODO: 스크롤 영역 수정 가능성 있음
            ScrollView {
                TitleTextBox(
                    title: "수업 시간표를 입력해주세요.",
                    subtitle: "수업 시간표를 입력하면, 공강 시간표로 바꿔드려요.",
                    highlightSubtitleText: "수업 시간표"
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 54)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
                
                OnboardingTimeTable(
                    selectedCells: $selectedCells,
                    classTimeTable: $classTimeTable
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 60)
            }
            
            Spacer()
            
            BasicButton(
                text: "공강 시간표로 변환",
                isActivated: !selectedCells.isEmpty
            ) {
                navigationManager.push(view: SignupDestination.mbtiSelection)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .customNavigationBar(showBackButton: true)
    }
}

#Preview {
    ClassTimeTableInputView()
}
