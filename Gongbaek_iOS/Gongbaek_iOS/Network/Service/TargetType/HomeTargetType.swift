//
//  HomeTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Moya

enum HomeTargetType {
    case getUserProfile
    case getUpcomingMeeting
    case getJoinableMeetingList(groupType: String)
}

extension HomeTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getUserProfile:
            return APIConstants.accessTokenHeader
        case .getUpcomingMeeting:
            return APIConstants.accessTokenHeader
        case .getJoinableMeetingList:
            return APIConstants.accessTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getUserProfile:
            return "/api/v1/user/home/profile"
        case .getUpcomingMeeting:
            return "/api/v1/group/my/participation"
        case .getJoinableMeetingList:
            return "/api/v1/group/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserProfile:
            return .get
        case .getUpcomingMeeting:
            return .get
        case .getJoinableMeetingList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserProfile:
            return .requestPlain
        case .getUpcomingMeeting:
            return .requestPlain
        case .getJoinableMeetingList(let groupType):
            return .requestParameters(
                parameters: [
                    "groupType" : groupType
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
}
