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
    @State private var temporarySelectedResult: String = ""
    @State private var searchWord = ""
    @State private var searchResultList: [String] = []
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
                    searchResultList = SchoolNameListModel.mockData().schoolNames
                case .major:
                    searchResultList = MajorNameListModel.mockData().schoolMajors
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            
            searchResultListView()
            
            Spacer()
            
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
        .customNavigationBar(title: "검색하기", showXButton: true)
        .onAppear {
            temporarySelectedResult = selectedResult
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
}

struct SearchListCell: View {
    let name: String
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isSelected ? .subOrange : .grayWhite)
                .frame(maxWidth: .infinity, minHeight: 52)
            
            HStack {
                Text(name)
                    .pretendardFont(isSelected ? .body1_m_16 : .body1_r_16)
                    .foregroundStyle(isSelected ? .mainOrange : .gray08)
                
                Spacer()
                
                if isSelected {
                    Image(.icCheck24)
                        .renderingMode(.original)
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                }
            }
            .padding(.horizontal, 16)
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity, minHeight: 52)
    }
}

#Preview {
    @Previewable @State var result = ""
    
    SchoolMajorSearchView(selectedResult: $result, state: .school)
}
