//
//  PostCommentRequestBodyDTO.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/23/25.
//

struct PostCommentRequestBodyDTO: Codable {
    let groupId: Int
    let groupType: String
    let isPublic: Bool
    let body: String
}
