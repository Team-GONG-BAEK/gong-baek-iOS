//
//  PostSignupResponseDTO.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/23/25.
//

import Foundation

struct PostSignupResponseDTO: Codable {
    let userId: Int
    let accessToken: String
    let refreshToken: String
}
