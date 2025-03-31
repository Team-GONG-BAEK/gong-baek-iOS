//
//  MyPageTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/27/25.
//

import Moya

enum MyPageTargetType {
    case getMyProfile
    case getMyFilling(category: String, status: Bool)
}

extension MyPageTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMyProfile, .getMyFilling:
            return APIConstants.accessTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMyProfile:
            return "/api/v1/user/my/profile"
        case .getMyFilling:
            return "/api/v1/my/groups"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyProfile, .getMyFilling:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyProfile:
            return .requestPlain
        case .getMyFilling(let category, let status):
            return .requestParameters(parameters: ["category": category, "status": status], encoding: URLEncoding.default)
        }
    }
}
