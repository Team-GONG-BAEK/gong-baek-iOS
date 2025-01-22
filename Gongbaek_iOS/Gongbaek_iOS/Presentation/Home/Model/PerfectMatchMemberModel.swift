//
//  PerfectMatchMemberModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import Foundation

struct PerfectMatchMemberModel {
    let profileImage: Int
    let nickname: String
    let sex: String
    let major: String
}

extension PerfectMatchMemberModel {
    
    static func mockData() -> [PerfectMatchMemberModel] {
        [
            PerfectMatchMemberModel(
                profileImage: 1,
                nickname: "나여니",
                sex: "WOMAN",
                major: "컴퓨터공학과"
            ),
            PerfectMatchMemberModel(
                profileImage: 4,
                nickname: "아름다웠던그대다시볼수있다면",
                sex: "MAN",
                major: "클래식피아노전공"
            ),
            PerfectMatchMemberModel(
                profileImage: 5,
                nickname: "목청좋은아이",
                sex: "WOMAN",
                major: "성악과"
            )
        ]
    }
}
