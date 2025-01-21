//
//  OwnerInfoModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

struct OwnerInfoModel: Decodable {
    var profileImg: Int
    var nickname: String
    var sex: String
    var schoolMajor: String
    var enterYear: Int
    var schoolGrade: Int
    var mbti: String
    var introduction: String
}

let dummyOwnerInfoData: OwnerInfoModel = OwnerInfoModel(
    profileImg: 1,
    nickname: "나공일히은",
    sex: "MAN",
    schoolMajor: "미디어기술콘텐츠학과",
    enterYear: 2020,
    schoolGrade: 4,
    mbti: "INTJ",
    introduction: "하이 나 공일 히은 ㅋㅋ 나랑 놀 사람? 나 칭구 없어 ㅠ 야 공이 너 내 칭구해라 ! 로이임탄은 꺼지슈 !"
)
