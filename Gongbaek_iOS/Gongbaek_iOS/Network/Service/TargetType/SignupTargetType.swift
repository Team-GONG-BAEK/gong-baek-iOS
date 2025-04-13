//
//  SignupTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/22/25.
//

import Moya

enum SignupTargetType {
    case postNicknameValidation(nickname: String)
    case getSchoolSearchResults(schoolName: String)
    case getMajorSearchResults(schoolName: String, majorName: String)
    case postSignup(data: PostSignupRequestDTO)
    case postSendEmailVerificationCode(email: String, schoolName: String)
    case getSchoolEmailVerification(email: String, schoolName: String, code: String)
}

extension SignupTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postNicknameValidation:
            return APIConstants.contentTypeHeader
        case .getSchoolSearchResults:
            return APIConstants.contentTypeHeader
        case .getMajorSearchResults:
            return APIConstants.contentTypeHeader
        case .postSignup:
            return APIConstants.contentTypeHeader
        case .postSendEmailVerificationCode:
            return APIConstants.contentTypeHeader
        case .getSchoolEmailVerification:
            return APIConstants.contentTypeHeader
        }
    }
    
    var path: String {
        switch self {
        case .postNicknameValidation:
            return "/api/v1/user/validate/nickname"
        case .getSchoolSearchResults:
            return "/api/v1/school/search"
        case .getMajorSearchResults:
            return "/api/v1/school/major/search"
        case .postSignup:
            return "/api/v1/user/signup"
        case .postSendEmailVerificationCode:
            return "/api/v1/emails/verification-requests"
        case .getSchoolEmailVerification:
            return "/api/v1/emails/verifications"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postNicknameValidation:
            return .post
        case .getSchoolSearchResults:
            return .get
        case .getMajorSearchResults:
            return .get
        case .postSignup:
            return .post
        case .postSendEmailVerificationCode:
            return .post
        case .getSchoolEmailVerification:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
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
        case .postSendEmailVerificationCode(let email, let schoolName):
            return .requestParameters(
                parameters: [
                    "email" : email,
                    "schoolName" : schoolName,
                ],
                encoding: URLEncoding.queryString
            )
        case .getSchoolEmailVerification(let email, let schoolName, let code):
            return .requestParameters(
                parameters: [
                    "email" : email,
                    "schoolName" : schoolName,
                    "code" : code,
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
}
