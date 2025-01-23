//
//  CommentTargetType.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

import Moya

enum CommentTargetType {
    case getComments(isPublic: Bool, groupId: Int, groupType: String)
    case postComment(data: PostCommentRequestBodyDTO)
}

extension CommentTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getComments:
            return APIConstants.hasTokenHeader
        case .postComment:
            return APIConstants.hasTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getComments:
            return "/api/v1/comments"
        case .postComment:
            return "/api/v1/comment"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getComments:
            return .get
        case .postComment:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getComments(_, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": false,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .postComment(let data):
            return .requestJSONEncodable(data)
        }
    }
}
