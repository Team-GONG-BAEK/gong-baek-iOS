//
//  CommentViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 6/26/25.
//

import Foundation

protocol CommentManageable: ObservableObject {
    var commentData: GetCommentsResponseDTO? { get set }
    
    /// API Func
    func postComment(groupId: Int, groupType: String, commentContent: String)
    func getComments(groupId: Int, groupType: String, completion: @escaping (GetCommentsResponseDTO) -> ())
    func deleteComment(groupId: Int, groupType: String, commentId: Int)
    func reportComment(commentId: Int, completion: @escaping () -> ())
    
    /// Handle Func
    func handleReportAction(commentId: Int)
}

extension CommentManageable {
    
    func postComment(_ requestData: PostCommentRequestBodyDTO, completion: @escaping (BaseResponse<EmptyResponseDTO>) -> ()) {
        Providers.commentProvider.request(
            target: .postComment(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            completion(response)
        }
    }
    
    func getComments(
        isPublic: Bool,
        groupId: Int,
        groupType: String,
        completion: @escaping (BaseResponse<GetCommentsResponseDTO>) -> ()
    ) {
        Providers.commentProvider.request(
            target: .getComments(
                isPublic: isPublic,
                groupId: groupId,
                groupType: groupType
            ),
            instance: BaseResponse<GetCommentsResponseDTO>.self
        ) { response in
            completion(response)
        }
    }
    
    func deleteComment(commentId: Int, completion: @escaping (BaseResponse<EmptyResponseDTO>) -> ()) {
        let requestData = DeleteCommentRequestDTO(commentId: commentId)
        
        Providers.commentProvider.request(
            target: .deleteComment(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            completion(response)
        }
    }
    
    func reportComment(commentId: Int, completion: @escaping (BaseResponse<EmptyResponseDTO>) -> ()) {
    }
}
