///
//  CycleSelect.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: AddMeetingViewModel
    @StateObject private var keyboard = KeyboardObserver()
    @State private var alertState: Bool? = nil
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                VStack(alignment: .leading, spacing: 0) {
                    ProgressBar(currentIndex: viewModel.currentIndex)
                    
                    ScrollView {
                        Group {
                            switch viewModel.currentIndex {
                            case 0:
                                CycleSelect(viewModel: viewModel)
                            case 1:
                                if viewModel.selectedCycle == .once {
                                    CalendarSelect(viewModel: viewModel)
                                } else if viewModel.selectedCycle == .weekly {
                                    WeekDaySelect(viewModel: viewModel)
                                }
                            case 2:
                                TimeSelect(viewModel: viewModel)
                            case 3:
                                CategorySelect(viewModel: viewModel)
                            case 4:
                                CoverImageSelect(viewModel: viewModel)
                            case 5:
                                LocationInput(viewModel: viewModel)
                            case 6:
                                IntroduceInput(viewModel: viewModel)
                            default:
                                CheckInputInfo(viewModel: viewModel)
                            }
                        }
                        .padding(.top, 40)
                        .padding(.bottom, keyboard.keyboardHeight)
                    }
                    
                    Spacer()
                    
                    let isLastStep = viewModel.currentIndex == viewModel.totalSteps - 1
                    
                    BasicButton(
                        text: isLastStep ? "등록하기" : "다음",
                        isActivated: viewModel.isNextButtonEnabled()
                    ) {
                        if isLastStep {
                            viewModel.postMeeting() { isSuccess in
                                alertState = isSuccess
                            }
                        } else {
                            viewModel.goToNextPage()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                    .background(.clear)
                }
                .customNavigationBar(
                    showBackButton: true,
                    onBackButtonTap: {
                        goBackToPreviousStep()
                    }
                )
                
                if let isSuccess = alertState {
                    GongbaekAlert(
                        alertImage: isSuccess ? "img_success" : "img_fail",
                        titleText: isSuccess ? "모임 등록이 완료됐어요!" : "모임 등록에 실패했어요!",
                        orangeButtonText: "확인",
                        onTapOrangeButton: {
                            alertState = nil
                            if isSuccess {
                                navigationManager.popToRoot()
                                navigationManager.selectedTab = .filling
                            } else {
                                viewModel.retryCount += 1
                            }
                        }
                    )
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        .onAppear {
            viewModel.getTimeTable()
        }
    }
}

extension AddMeetingView {
    
    private func goBackToPreviousStep() {
        if viewModel.currentIndex == 0 {
            navigationManager.pop()
        } else {
            viewModel.currentIndex -= 1
        }
    }
}

#Preview {
    @Previewable @State var viewModel = AddMeetingViewModel()
    CoverImageSelect(viewModel: viewModel)
}
