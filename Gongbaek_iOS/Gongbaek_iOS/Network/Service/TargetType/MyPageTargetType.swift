//
//  MyPageTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/27/25.
//

import Moya

enum MyPageTargetType {
    case getMyProfile
}

extension MyPageTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMyProfile:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMyProfile:
            return "/api/v1/user/my/profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyProfile:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyProfile:
            return .requestPlain
        }
    }
}
