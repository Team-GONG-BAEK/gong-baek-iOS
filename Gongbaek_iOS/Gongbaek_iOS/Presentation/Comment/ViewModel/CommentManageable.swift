//
//  CommentViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 6/26/25.
//

import Foundation

protocol CommentManageable: ObservableObject {
    var commentData: GetCommentsResponseDTO? { get set }
    
    func postComment(groupId: Int, groupType: String, commentContent: String)
    func getComments(groupId: Int, groupType: String, completion: @escaping (GetCommentsResponseDTO) -> ())
    func deleteComment(groupId: Int, groupType: String, commentId: Int)
//    func reportComment(groupId: Int, groupType: String, commentId: Int)
}

extension CommentManageable {
    
    func postComment(groupId: Int, groupType: String, commentContent: String) {
    }
    
    func getComments(groupId: Int, groupType: String, completion: @escaping (GetCommentsResponseDTO) -> ()) {
        
    }
    
    func deleteComment(groupId: Int, groupType: String, commentId: Int) {
        
    }
}
