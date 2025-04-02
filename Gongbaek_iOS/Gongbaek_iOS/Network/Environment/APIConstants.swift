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
    static var authCode = ""
    static let Bearer = "Bearer "
}

extension APIConstants {
    static let authCodeHeader: [String: String] = [
        contentType: applicationJSON,
        auth: Bearer + authCode
    ]
    
    static let hasContentTypeHeader: [String: String] = [
        contentType: applicationJSON
    ]
    
    static var appleAuthHeader: [String: String] = [
        contentType: applicationJSON,
        auth: TokenManager.shared.identityTokenValue
    ]
    
    static var accessTokenHeader: [String: String] = [
        contentType: applicationJSON,
        auth: Bearer + TokenManager.shared.accessTokenValue
    ]
    
    static var refreshTokenHeader: [String: String] = [
        contentType: applicationJSON,
        auth: TokenManager.shared.refreshTokenValue
    ]
}
