//
//  OwnerInfoModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct OwnerInfoData: Decodable {
    let profileImg: Int
    let nickname: String
    let sex: String
    let schoolMajor: String
    let enterYear: Int
    let schoolGrade: Int
    let mbti: String
    let introduction: String
}

let dummyOwnerInfoData: OwnerInfoData = OwnerInfoData(
    profileImg: 1,
    nickname: "나공일히은",
    sex: "FEMALE",
    schoolMajor: "미디어기술콘텐츠학과",
    enterYear: 2020,
    schoolGrade: 4,
    mbti: "INTJ",
    introduction: "하이 나 공일 히은 ㅋㅋ 나랑 놀 사람? 나 칭구 없어 ㅠ"
)
