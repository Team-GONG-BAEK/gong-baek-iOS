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
//    case getMyFilling()
}

extension FillingTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .postMeeting, .getTimeTable :
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .postMeeting:
            return "/api/v1/gongbaek"
        case .getTimeTable:
            return "/api/v1/my/timeTable"
//        case .getMyFilling:
//            return "/api/v1/my/groups"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postMeeting:
            return .post
        case .getTimeTable:
            return .get
//        case .getMyFilling:
//            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postMeeting(let data):
            return .requestJSONEncodable(data)
        case .getTimeTable:
            return .requestPlain
//        case .getMyFilling():
//            return .requestParameters(parameters: <#T##[String : Any]#>, encoding: <#T##any ParameterEncoding#>)
        }
    }
}
