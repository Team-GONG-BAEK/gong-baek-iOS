//
//  Providers.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

struct Providers {
    static let authProvider = NetworkProvider<AuthTargetType>(withAuth: true)
    static let homeProvider = NetworkProvider<HomeTargetType>(withAuth: true)
    static let fillingProvider = NetworkProvider<FillingTargetType>(withAuth: true)
    static let meetingRoomProvider = NetworkProvider<MeetingRoomTargetType>(withAuth: true)
    static let meetingDetailProvider = NetworkProvider<MeetingDetailTargetType>(withAuth: true)
    static let commentProvider = NetworkProvider<CommentTargetType>(withAuth: true)
    static let SignupProvider = NetworkProvider<SignupTargetType>(withAuth: false)
    static let mypageProvider = NetworkProvider<MyPageTargetType>(withAuth: true)
}

extension MoyaProvider {
    convenience init(withAuth: Bool) {
        if withAuth {
            // TokenInterceptor를 사용하여 인증을 처리하는 Session을 생성
            // NetworkProvider 초기화 시 TokenInterceptor를 통해 토큰 관리 & 갱신
            // 네트워크 요청 전 토큰을 헤더에 추가해 401X 에러 발생 시 토큰 갱신 후 요청 재시도
            let interceptor = TokenInterceptor.shared
            let session = Session(interceptor: interceptor)
            self.init(session: session, plugins: [MoyaLoggingPlugin()])
        } else {
            // 인증이 필요 없는 경우 기본 세션으로 초기화
            self.init(plugins: [MoyaLoggingPlugin()])
        }
    }
}
