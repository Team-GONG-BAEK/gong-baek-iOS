//
//  LoginTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import Moya

enum AuthTargetType {
    case postSignin(requestBody: PostSigninRequestDTO)
    case deleteLogout
    case deleteWidthdraw
}

extension AuthTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postSignin:
            return APIConstants.appleAuthHeader
        case .deleteLogout:
            return APIConstants.accessTokenHeader
        case .deleteWidthdraw:
            return APIConstants.accessTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .postSignin:
            return "/api/v1/login"
        case .deleteLogout:
            return "/api/v1/logout"
        case .deleteWidthdraw:
            return "/api/v1/withdraw"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postSignin:
            return .post
        case .deleteLogout, .deleteWidthdraw:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postSignin(let requstBody):
            return .requestJSONEncodable(requstBody)
        case .deleteLogout, .deleteWidthdraw:
            return .requestPlain
        }
    }
}

