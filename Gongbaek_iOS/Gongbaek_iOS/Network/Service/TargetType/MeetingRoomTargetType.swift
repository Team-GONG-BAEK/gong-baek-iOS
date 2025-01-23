//
//  MeetingRoomTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Moya

enum MeetingRoomTargetType {
    case getMembers(isPublic: Bool, groupId: Int, groupType: String)
    case getMeetingDetails(groupId: Int, groupType: String)
}

extension MeetingRoomTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMembers:
            return APIConstants.hasTokenHeader
        case .getMeetingDetails:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMembers:
            return "/api/v1/fill/members"
        case .getMeetingDetails:
            return "/api/v1/fill/info"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMembers:
            return .get
        case .getMeetingDetails:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMembers(_, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": false,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .getMeetingDetails(let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
}
