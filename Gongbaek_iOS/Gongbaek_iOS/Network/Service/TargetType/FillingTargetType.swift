//
//  FillingTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/22/25.
//

import Moya

enum FillingTargetType {
    case postMeeting(data: AddMeetingModel)
    case getTimeTable
    case getFilling(category: String)
    case getMyFilling(category: String, status: Bool)
}

extension FillingTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postMeeting, .getTimeTable, .getFilling, .getMyFilling:
            return APIConstants.accessTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .postMeeting:
            return "/api/v1/gongbaek"
        case .getTimeTable:
            return "/api/v1/my/timeTable"
        case .getFilling:
            return "/api/v1/fill/groups"
        case .getMyFilling:
            return "/api/v1/my/groups"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postMeeting:
            return .post
        case .getTimeTable:
            return .get
        case .getFilling:
            return .get
        case .getMyFilling:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postMeeting(let data):
            return .requestJSONEncodable(data)
        case .getTimeTable:
            return .requestPlain
        case .getFilling(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.default)
        case .getMyFilling(let category, let status):
            return .requestParameters(parameters: ["category": category, "status": status], encoding: URLEncoding.default)
        }
    }
}
