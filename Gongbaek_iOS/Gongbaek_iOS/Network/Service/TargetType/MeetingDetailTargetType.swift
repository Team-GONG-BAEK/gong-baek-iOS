//
//  MeetingDetailTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Moya

enum MeetingDetailTargetType {
    case getMeetingDetails(isPublic: Bool, groupId: Int, groupType: String)
    case getOwnerInfo(groupId: Int, groupType: String)
    case postApplyMeeting(data: PostApplyMeetingRequestBodyDTO)
}

extension MeetingDetailTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMeetingDetails:
            return APIConstants.hasTokenHeader
        case .getOwnerInfo:
            return APIConstants.hasTokenHeader
        case .postApplyMeeting:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMeetingDetails:
            return "/api/v1/fill/info"
        case .getOwnerInfo:
            return "/api/v1/fill/user/info"
        case .postApplyMeeting:
            return "/api/v1/group"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMeetingDetails:
            return .get
        case .getOwnerInfo:
            return .get
        case .postApplyMeeting:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMeetingDetails(_, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": true,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .getOwnerInfo(let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .postApplyMeeting(let data):
            return .requestJSONEncodable(data)
        }
    }
}
