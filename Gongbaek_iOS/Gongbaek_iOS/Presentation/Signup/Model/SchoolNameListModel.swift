//
//  SchoolNameListModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import Foundation

struct SchoolNameListModel: Codable {
    let schoolNames: [String]
}

extension SchoolNameListModel {
    
    static func mockData() -> SchoolNameListModel {
        SchoolNameListModel(schoolNames: [
            "가톨릭대학교",
            "광운대학교",
            "건국대학교",
            "기막힌대학교",
            "나사렛대학교",
            "나사빠진대학교",
            "대진대학교",
            "돼지대학교",
            "동국대학교",
            "도토리대학교",
            "명지대학교",
            "이화여자대학교"
        ])
    }
}
