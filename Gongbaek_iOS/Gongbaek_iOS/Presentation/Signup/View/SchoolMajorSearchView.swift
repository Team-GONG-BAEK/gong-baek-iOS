//
//  SchoolMajorSearchView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorSearchView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @FocusState private var isTextFieldFocused
    @Binding var selectedResult: String
    @State private var temporarySelectedResult: String = ""
    @State private var textFieldText = ""
    @State private var searchWord = ""
    @State private var searchResultList: [String] = []
    let state: SearchViewState
    
    var body: some View {
        VStack {
            searchTextField()
            
            if !searchWord.isEmpty {
                if searchResultList.isEmpty {
                    emptyView()
                } else {
                    searchResultListView()
                }
                
                if state == .major {
                    MajorDirectRegistrationButton(majorName: searchWord) {
                        selectedResult = searchWord
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
            inputText: $textFieldText,
            isButton: false,
            state: state
        ) { textFieldText in
            if !textFieldText.isEmpty {
                // TODO: 뷰모델 검색 api 연결
                self.searchWord = textFieldText
                getSearchResultList()
                isTextFieldFocused = false
            }
        }
        .onSubmit {
            searchWord = textFieldText
            getSearchResultList()
        }
        .submitLabel(.search)
        .focused($isTextFieldFocused)
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
        List(searchResultList, id: \.self) { item in
            let isSelected = temporarySelectedResult == item
            
            SearchListCell(
                name: item,
                isSelected:.constant(isSelected)
            )
            .onTapGesture {
                if isSelected {
                    temporarySelectedResult = ""
                } else {
                    temporarySelectedResult = item
                }
            }
        }
        .listStyle(.plain)
        .padding(.top, 12)
    }
    
    private func applyButton() -> some View {
        BasicButton(
            text: "적용",
            isActivated: !temporarySelectedResult.isEmpty
        ) {
            selectedResult = temporarySelectedResult
            navigationManager.dismissPresented()
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
}

extension SchoolMajorSearchView {
    
    private func getSearchResultList() {
        switch state {
        case .school:
            searchResultList = SchoolNameListModel.mockData().schoolNames
        case .major:
            searchResultList = MajorNameListModel.mockData().schoolMajors
        }
    }
}

#Preview {
    @Previewable @State var result = ""
    
    SchoolMajorSearchView(selectedResult: $result, state: .major)
}
