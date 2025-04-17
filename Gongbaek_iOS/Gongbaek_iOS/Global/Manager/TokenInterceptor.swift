//
//  TokenInterceptor.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/21/25.
//

import Foundation

import Alamofire

// Alamofire의 RequestInterceptor를 상속받아 구현
final class TokenInterceptor: RequestInterceptor {
    
    // 싱글톤 패턴으로 인스턴스 하나만 생성
    static let shared = TokenInterceptor()
    
    private init() {}
    
    
    // 요청이 서버로 보내지기 전 호출됨
    // 토큰 만료로 갱신이 필요할 시
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        let isSignIn: Bool = urlRequest.url?.path.contains("/login") ?? false
        
        // 로그인 API 헤더엔 액세스 토큰이 아닌 identityToken이 들어가므로, adapt() 함수 내에서 헤더가 바뀌지 않도록 함.
        if !isSignIn {
            if let accessToken = TokenManager.shared.accessToken {
                // 항상 최신의 액세스 토큰을 사용하도록 함.
                // 기존 요청 재시도 할 경우 다시 최신 토큰으로 setValue 해주지 않으면 만료된 토큰 그대로 남아있음.
                urlRequest.setValue(APIConstants.Bearer + accessToken, forHTTPHeaderField: APIConstants.auth)
            }
        }
        
        print("🍏 adaptor 적용 헤더: \(urlRequest.headers)")
        completion(.success(urlRequest))
    }
    
    // 요청 실패 시 호출
    // 토큰 만료 에러일 경우 토큰 갱신 후 기존 요청 재시도
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("-------🔧retry 시작🔧-------")
        
        guard let response = request.response, response.statusCode == 401
        else {
            // 401X 에러가 아니라면 재시도 하지 않고 오류를 그대로 반환
            completion(.doNotRetryWithError(error))
            return
        }
        
        Providers.SignupProvider.request(
            target: .patchReissue,
            instance: BaseResponse<PatchReissueResponse>.self
        ) { response in
            if response.success {
                print("토큰 재발급 완료 -> 기존 요청 재시도")
                if let tokenData = response.data {
                    TokenManager.shared.updateToken(tokenData.accessToken, tokenData.refreshToken)
                }
                completion(.retry)
            } else {
                print("🚨 토큰 갱신 실패")
                TokenManager.shared.clearAll()
                // 내비게이션 매니저 필요한디... 루트뷰 로그인화면으로 바꿔야 함... 어떻게 가져올까 고민해봐야 할듯 ㅠ
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
