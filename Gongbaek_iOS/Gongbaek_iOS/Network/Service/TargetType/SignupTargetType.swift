//
//  SignupTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/22/25.
//

import Moya

enum SignupTargetType {
    case postNicknameValidation(nickname: String)
}

extension SignupTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postNicknameValidation:
            return APIConstants.hasContentTypeHeader
        }
    }
    
    var path: String {
        switch self {
        case .postNicknameValidation:
            return "/api/v1/user/validate/nickname"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postNicknameValidation:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postNicknameValidation(let nickname):
            return .requestParameters(
                parameters: ["nickname" : nickname],
                encoding: URLEncoding.queryString
            )
        }
    }
}
