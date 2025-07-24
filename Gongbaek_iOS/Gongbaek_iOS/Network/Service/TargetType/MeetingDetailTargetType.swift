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
    case patchApplyMeeting(data: PostApplyMeetingRequestBodyDTO)
    case deleteMyMeeting(data: PostApplyMeetingRequestBodyDTO)
    case reportMeeting(groupId: Int, groupType: String)
}

extension MeetingDetailTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMeetingDetails:
            return APIConstants.accessTokenHeader
        case .getOwnerInfo:
            return APIConstants.accessTokenHeader
        case .postApplyMeeting:
            return APIConstants.accessTokenHeader
        case .patchApplyMeeting:
            return APIConstants.accessTokenHeader
        case .deleteMyMeeting:
            return APIConstants.accessTokenHeader
        case .reportMeeting:
            return APIConstants.accessTokenHeader
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
        case .patchApplyMeeting:
            return "/api/v1/my/groups"
        case .deleteMyMeeting:
            return "/api/v1/my/groups"
        case .reportMeeting(let groupId, _):
            return "/api/v1/reports/group/\(groupId)"
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
        case .patchApplyMeeting:
            return .patch
        case .deleteMyMeeting:
            return .delete
        case .reportMeeting:
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
        case .patchApplyMeeting(let data):
            return .requestJSONEncodable(data)
        case .deleteMyMeeting(let data):
            return .requestJSONEncodable(data)
        case .reportMeeting(let groupId, let groupType):
            return .requestParameters(
                parameters: ["groupType": groupType],
                encoding: URLEncoding.queryString
            )
        }
    }
}
