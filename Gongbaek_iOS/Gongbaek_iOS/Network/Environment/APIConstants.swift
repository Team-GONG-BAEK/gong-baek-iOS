//
//  APIConstants.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

struct APIConstants{
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let auth = "Authorization"
    static let access = "accessToken"
    static let refresh = "refreshToken"
    static let accessToken = "Bearer " + ""
    static let refreshToken = "Bearer " + ""
    static let Bearer = "Bearer "
}

extension APIConstants {
    static let contentTypeHeader: [String: String] = [
        contentType: applicationJSON
    ]
    
    static var appleAuthHeader: [String: String] {
        [contentType: applicationJSON,
            auth: TokenManager.shared.identityTokenValue]
    }
    
    static var accessTokenHeader: [String: String] {
        [contentType: applicationJSON,
                auth: Bearer + TokenManager.shared.accessTokenValue]
    }
    
    static var refreshTokenHeader: [String: String] {
        [contentType: applicationJSON,
                auth: Bearer + TokenManager.shared.refreshTokenValue]
    }
  
    static let signupAccessTokenHeader: [String: String] = [
        contentType: applicationJSON,
        auth: Bearer + TokenManager.shared.signupAccessTokenValue
    ]
}
