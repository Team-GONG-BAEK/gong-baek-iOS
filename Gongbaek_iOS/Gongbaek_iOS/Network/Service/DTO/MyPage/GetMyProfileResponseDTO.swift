//
//  GetMyProfileResponse.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/27/25.
//

import Foundation

struct GetMyProfileResponseDTO: Codable {
    let nickname: String
    let schoolName: String
    let majorName: String
    let profileImg: Int
}
