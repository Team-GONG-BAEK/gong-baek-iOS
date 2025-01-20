//
//  MajorNameListModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/19/25.
//

import Foundation

struct MajorNameListModel: Codable {
    let schoolMajors: [String]
}

extension MajorNameListModel {
    
    static func mockData() -> MajorNameListModel {
        MajorNameListModel(schoolMajors: [
            "기계공학과",
            "건축공학과",
            "건축학과",
            "경영학과",
            "노어노문학과",
            "독어독문학과",
            "사학과",
            "영어영문학과",
            "융합소프트웨어학부",
            "전자공학과",
            "컴퓨터공학과",
            "화학생명공학과",
        ])
    }
}

