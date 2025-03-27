//
//  TokenInterceptor.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/21/25.
//

import UIKit

import Alamofire

// Alamofire의 RequestInterceptor를 상속받아 구현
final class TokenInterceptor: RequestInterceptor {

    // 싱글톤 패턴으로 인스턴스 하나만 생성
    static let shared = TokenInterceptor()

    private init() {}

    
    // 요청이 서버로 보내지기 전 호출됨
    // 토큰 만료로 갱신이 필요할 시
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        // 토큰이 있는지 확인
        guard urlRequest.url?.absoluteString.hasPrefix(Config.baseURL) == true,
              let accessToken = TokenManager.shared.accessToken,
              let refreshToken = TokenManager.shared.refreshToken
        else {
            completion(.success(urlRequest)) // 토큰이 없으면 요청을 그대로 반환
            return
        }
        
        // 요청 헤더에 accessToken과 refreshToken을 추가
        var urlRequest = urlRequest
        urlRequest.setValue(accessToken, forHTTPHeaderField: APIConstants.access)
        urlRequest.setValue(refreshToken, forHTTPHeaderField: APIConstants.refresh)
        
        print("adator 적용 \(urlRequest.headers)")
        completion(.success(urlRequest))
    }

    // 요청 실패 시 호출
    // 토큰 만료 에러일 경우 토큰 갱신 후 기존 요청 재시도
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401
        else {
            // 401X 에러가 아니라면 재시도 하지 않고 오류를 그대로 반환
            completion(.doNotRetryWithError(error))
            return
        }

        // 토큰 갱신 API 호출
        TokenManager.shared.reissueToken { success in
            if success {
                print("토큰 갱신 완료 -> 기존 요청 재시도")
                completion(.retry)
            } else {
                print("🚨 토큰 갱신 실패")
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
