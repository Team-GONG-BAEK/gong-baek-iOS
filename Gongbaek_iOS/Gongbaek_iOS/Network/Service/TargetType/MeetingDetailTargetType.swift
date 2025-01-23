//
//  MeetingDetailTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Moya

enum MeetingDetailTargetType {
    case getMeetingDetails(groupId: Int, groupType: String)
    case postApplyMeeting(data: PostApplyMeetingRequestBodyDTO)
}

extension MeetingDetailTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getMeetingDetails:
            return APIConstants.hasTokenHeader
        case .postApplyMeeting:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getMeetingDetails:
            return "/api/v1/fill/info"
        case .postApplyMeeting:
            return "/api/v1/group"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMeetingDetails:
            return .get
        case .postApplyMeeting:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMeetingDetails(let groupId, let groupType):
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
