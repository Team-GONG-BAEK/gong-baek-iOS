//
//  SchoolMajorSearchView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorSearchView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: SignupViewModel
    let state: SearchViewState
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                searchTextField()
                
                if !viewModel.searchWord.isEmpty {
                    if viewModel.searchResultList.isEmpty {
                        emptyView()
                    } else {
                        searchResultListView()
                    }
                    
                    if state == .major {
                        MajorDirectRegistrationButton(majorName: viewModel.searchWord) {
                            viewModel.majorName = viewModel.searchWord
                            navigationManager.dismissPresented()
                        }
                        .padding(.horizontal, 16)
                    }
                } else {
                    Spacer()
                }
                
                applyButton()
            }
            .customNavigationBar(title: "검색하기", showXButton: true)
            
            if viewModel.showAlert {
                CustomedAlert(
                    alertImage: "img_fail" ,
                    titleText: "앗! 데이터를 불러오지 못했어요.",
                    subtitleText: "다시 시도해주세요.",
                    orangeButtonText: "확인",
                    onTapOrangeButton: {
                        viewModel.showAlert = false
                    }
                )
            }
        }
        
    }
    
    private func searchTextField() -> some View {
        SearchTextField(
            inputText: $viewModel.textFieldText,
            isButton: false,
            state: state
        ) { textFieldText in
            if !textFieldText.isEmpty {
                onTapSearchButton()
            }
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .onSubmit {
            onTapSearchButton()
        }
        .submitLabel(.search)
        .environment(\.locale, Locale(identifier: "ko_KR"))
        .padding(.top, 12)
        .padding(.horizontal, 16)
    }
    
    private func emptyView() -> some View {
        VStack {
            Spacer()
            Text("검색결과가 없습니다.\n검색어가 올바른지 확인하고 다시 검색해주세요.")
                .pretendardFont(.caption2_m_12)
                .foregroundStyle(.gray06)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
    
    private func searchResultListView() -> some View {
        let results = Array(Set(viewModel.searchResultList)).sorted()
        
        return List(results, id: \.self) { item in
            let isSelected = viewModel.selectedSearchResult == item
            
            SearchListCell(
                name: item,
                isSelected:.constant(isSelected)
            )
            .onTapGesture {
                if isSelected {
                    viewModel.selectedSearchResult = ""
                } else {
                    viewModel.selectedSearchResult = item
                }
            }
        }
        .listStyle(.plain)
        .padding(.top, 12)
    }
    
    private func applyButton() -> some View {
        BasicButton(
            text: "적용",
            isActivated: !viewModel.selectedSearchResult.isEmpty
        ) {
            switch state {
            case .school:
                viewModel.schoolName = viewModel.selectedSearchResult
            case .major:
                viewModel.majorName = viewModel.selectedSearchResult
            }
            navigationManager.dismissPresented()
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
}

extension SchoolMajorSearchView {
    
    private func onTapSearchButton() {
        viewModel.searchWord = viewModel.textFieldText
        viewModel.selectedSearchResult = ""
        getSearchResultList()
    }
    
    private func getSearchResultList() {
        switch state {
        case .school:
            viewModel.getSchoolSearchResults()
        case .major:
            viewModel.getMajorSearchResults()
        }
    }
}

#Preview {
    SchoolMajorSearchView(viewModel: SignupViewModel(), state: .major)
}
