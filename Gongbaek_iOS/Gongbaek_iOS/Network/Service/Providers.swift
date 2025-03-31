//
//  Providers.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

struct Providers {
    static let sigininProvider = NetworkProvider<AuthTargetType>(withAuth: false)
    static let homeProvider = NetworkProvider<HomeTargetType>(withAuth: false)
    static let fillingProvider = NetworkProvider<FillingTargetType>(withAuth: false)
    static let meetingRoomProvider = NetworkProvider<MeetingRoomTargetType>(withAuth: false)
    static let meetingDetailProvider = NetworkProvider<MeetingDetailTargetType>(withAuth: false)
    static let commentProvider = NetworkProvider<CommentTargetType>(withAuth: false)
    static let SignupProvider = NetworkProvider<SignupTargetType>(withAuth: false)
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
