//
//  AgreeView.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/26/25.
//

import SwiftUI

struct AgreementView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    @State private var isAllChecked: Bool = false
    @State private var isTermsSelected: Bool = false
    @State private var isPrivacySelected: Bool = false
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                    Button(action: {
                        toggleAllAgreement()
                    }) {
                        Image(isAllChecked ? .checkFill32 : .checkUnfill32)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Text("약관 전체동의")
                        .pretendardFont(.title2_m_18)
                        .foregroundColor(.grayBlack)
                }
                
                Divider()
                    .foregroundColor(.gray02)
                
                VStack(spacing: 8) {
                    AgreementListCell(
                        state: .terms,
                        isSelected: $isTermsSelected
                    )
                    AgreementListCell(
                        state: .privacy,
                        isSelected: $isPrivacySelected
                    )
                }
                .padding(.trailing, -12)
                
                Spacer()
                
                BasicButton(
                    text: "다음",
                    isActivated: isAllChecked,
                    onTap: { navigateToOnboardingView() }
                )
            }
            .padding(.horizontal, 16)
            .padding(.top, 38)
        }
        .customNavigationBar(viewName: "약관 동의", showBackButton: true)
        .onChange(of: [isTermsSelected, isPrivacySelected]) {
            updateIsChecked()
        }
    }
}

extension AgreementView {
    
    func toggleAllAgreement() {
        isAllChecked.toggle()
        
        isTermsSelected = isAllChecked
        isPrivacySelected = isAllChecked
    }
    
    func updateIsChecked() {
        isAllChecked = isTermsSelected && isPrivacySelected
    }
    
    func navigateToOnboardingView() {
        navigationManager.push(view: LoginDestination.onboarding)
    }
}

#Preview {
    AgreementView()
}
