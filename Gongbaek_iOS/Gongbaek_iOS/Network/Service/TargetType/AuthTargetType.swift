//
//  LoginTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/20/25.
//

import Moya

enum AuthTargetType {
    case postSignin(requestBody: PostSigninRequestDTO)
    case patchReissue
    case deleteLogout
    case deleteWidthdraw
}

extension AuthTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postSignin:
            return APIConstants.appleAuthHeader
        case .patchReissue:
            return APIConstants.refreshTokenHeader
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
        case .patchReissue:
            return "/api/v1/reissue/token"
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
        case .patchReissue:
            return .patch
        case .deleteLogout, .deleteWidthdraw:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postSignin(let requstBody):
            return .requestJSONEncodable(requstBody)
        case .patchReissue, .deleteLogout, .deleteWidthdraw:
            return .requestPlain
        }
    }
}

