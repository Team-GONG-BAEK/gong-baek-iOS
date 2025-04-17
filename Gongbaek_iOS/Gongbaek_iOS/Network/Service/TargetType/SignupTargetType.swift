//
//  SignupTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/22/25.
//

import Moya

enum SignupTargetType {
    case patchReissue
    case postNicknameValidation(nickname: String)
    case getSchoolSearchResults(schoolName: String)
    case getMajorSearchResults(schoolName: String, majorName: String)
    case postSignup(data: PostSignupRequestDTO)
}

extension SignupTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .patchReissue:
            return APIConstants.refreshTokenHeader
        case .postNicknameValidation:
            return APIConstants.contentTypeHeader
        case .getSchoolSearchResults:
            return APIConstants.contentTypeHeader
        case .getMajorSearchResults:
            return APIConstants.contentTypeHeader
        case .postSignup:
            return APIConstants.contentTypeHeader
        }
    }
    
    var path: String {
        switch self {
        case .patchReissue:
            return "/api/v1/reissue/token"
        case .postNicknameValidation:
            return "/api/v1/user/validate/nickname"
        case .getSchoolSearchResults:
            return "/api/v1/school/search"
        case .getMajorSearchResults:
            return "/api/v1/school/major/search"
        case .postSignup:
            return "/api/v1/user/signup"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .patchReissue:
            return .patch
        case .postNicknameValidation:
            return .post
        case .getSchoolSearchResults:
            return .get
        case .getMajorSearchResults:
            return .get
        case .postSignup:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .patchReissue:
            return .requestPlain
        case .postNicknameValidation(let nickname):
            return .requestParameters(
                parameters: ["nickname" : nickname],
                encoding: URLEncoding.queryString
            )
        case .getSchoolSearchResults(let schoolName):
            return .requestParameters(
                parameters: ["schoolName" : schoolName],
                encoding: URLEncoding.queryString
            )
        case .getMajorSearchResults(let schoolName, let majorName):
            return .requestParameters(
                parameters: [
                    "schoolName" : schoolName,
                    "majorName" : majorName,
                ],
                encoding: URLEncoding.queryString
            )
        case .postSignup(let data):
            return .requestJSONEncodable(data)
        }
    }
}
