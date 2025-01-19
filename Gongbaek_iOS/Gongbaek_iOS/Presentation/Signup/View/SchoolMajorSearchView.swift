//
//  SchoolMajorSearchView.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import SwiftUI

struct SchoolMajorSearchView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @Binding var selectedResult: String
    @State private var searchWord = ""
//    @State private var searchResultList = []
    let state: SearchViewState
    
    var body: some View {
        VStack {
            SearchTextField(
                inputText: $searchWord,
                isButton: false,
                state: state
            ) { searchWord in
                // TODO: 뷰모델 검색 api 연결
                print(searchWord)
                switch state {
                case .school:
                    selectedResult = searchWord
                case .major:
                    selectedResult = searchWord
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            
            searchResultList()
            
            Spacer()
            
            BasicButton(
                text: "적용",
                isActivated: !selectedResult.isEmpty
            ) {
                navigationManager.dismissPresented()
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
        .customNavigationBar(title: "검색하기", showXButton: true)
    }
    
    func searchResultList() -> some View {
        ScrollView {
            
        }
        .padding(.top, 12)
    }
}

#Preview {
    @Previewable @State var result = ""
    
    SchoolMajorSearchView(selectedResult: $result, state: .school)
}
