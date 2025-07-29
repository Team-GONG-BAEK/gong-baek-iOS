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
    case deleteComment(data: DeleteCommentRequestDTO)
    case reportComment(commentId: Int)
}

extension CommentTargetType: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .getComments:
            return APIConstants.accessTokenHeader
        case .postComment:
            return APIConstants.accessTokenHeader
        case .deleteComment:
            return APIConstants.accessTokenHeader
        case .reportComment:
            return APIConstants.accessTokenHeader
        }
    }
    
    var path: String {
        switch self {
        case .getComments:
            return "/api/v1/comments"
        case .postComment:
            return "/api/v1/comment"
        case .deleteComment:
            return "/api/v1/comment"
        case .reportComment(let commentId):
            return "/api/v1/reports/comment/\(commentId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getComments:
            return .get
        case .postComment:
            return .post
        case .deleteComment:
            return .delete
        case .reportComment:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getComments(let isPublic, let groupId, let groupType):
            return .requestParameters(
                parameters: [
                    "isPublic": isPublic,
                    "groupId": groupId,
                    "groupType": groupType
                ],
                encoding: URLEncoding.queryString
            )
        case .postComment(let data):
            return .requestJSONEncodable(data)
        case .deleteComment(let data):
            return .requestJSONEncodable(data)
        case .reportComment:
            return .requestPlain
        }
    }
}
