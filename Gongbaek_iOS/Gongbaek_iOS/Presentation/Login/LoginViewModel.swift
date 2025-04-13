//
//  LoginViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 3/25/25.
//

import SwiftUI
import AuthenticationServices

class LoginViewModel: NSObject, ObservableObject {
    // 로그인 상태 확인할 변수
    @Published var isSignedIn = false
    @Published var loginFlow: UserType? = nil
    
    // Apple 로그인
    func handleAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    // 로그인 서버 통신
    private func postSignin() {
        let requestBody = PostSigninRequestDTO(platform: PlatformType.APPLE.rawValue)
        
        Providers.authProvider.request(
            target: .postSignin(requestBody: requestBody),
            instance: BaseResponse<PostSigninResponseDTO>.self
        ) { response in
            guard response.success, let data = response.data else {
                print("🚨 서버 통신 실패: \(response.message ?? "알 수 없음")")
                return
            }
            
            self.isSignedIn = true
            
            DispatchQueue.main.async {
                if let userId = data.userId {
                    // 기존 유저 -> 토큰 저장 후 main으로
                    TokenManager.shared.updateToken(data.accessToken, data.refreshToken)
                    self.loginFlow = .existingUser
                } else {
                    // 신규 유저 -> 아직 회원가입 미완료 → 약관 동의로
                    // **회원가입 전 학교 이메일 인증에 액세스 토큰 필요하여 키체인에 저장**
                    TokenManager.shared.updateSignupAccessToken(data.accessToken)
                    self.loginFlow = .newUser
                }
            }
        }
    }
    
}

// Apple 로그인 결과 처리
extension LoginViewModel: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        
        let identityToken = appleIDCredential.identityToken.flatMap { String(data: $0, encoding: .utf8) }
        
        print("Apple 로그인 성공!!!")
        print("IdentityToken: \(String(describing: identityToken))")
        
        // Keychain에 애플 로그인 정보 저장
        TokenManager.shared.updateIdentityToken(identityToken: identityToken)
        
        //서버 통신 메서드 호출
        postSignin()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🚨Apple 로그인 실패: \(error.localizedDescription)")
    }
}

