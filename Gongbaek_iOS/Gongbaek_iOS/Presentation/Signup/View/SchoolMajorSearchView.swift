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
    }
    
    private func searchTextField() -> some View {
        SearchTextField(
            inputText: $viewModel.textFieldText,
            isButton: false,
            state: state
        ) { textFieldText in
            if !textFieldText.isEmpty {
                // TODO: 뷰모델 검색 api 연결
                onTapSearchButton()
            }
        }
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
        List(viewModel.searchResultList, id: \.self) { item in
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
            viewModel.getSchoolSearchResults() { response in
                
            }
        case .major:
            viewModel.searchResultList = MajorNameListModel.mockData().schoolMajors
        }
    }
}

#Preview {
    SchoolMajorSearchView(viewModel: SignupViewModel(), state: .major)
}
