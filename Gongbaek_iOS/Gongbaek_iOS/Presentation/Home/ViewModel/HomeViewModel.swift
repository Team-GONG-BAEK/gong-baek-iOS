//
//  HomeViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // 헤더
    @Published var schoolName = ""
    @Published var nickname = ""
    // 매주봐요 모임
    @Published var weeklyMeetingList: [MeetingModel] = MeetingModel.weeklyMeetingList()
    // 한번봐요 모임
    @Published var oneTimeMeetingList: [MeetingModel] = MeetingModel.weeklyMeetingList()
    // 나와 딱 맞는 멤버 (API 연결 X)
    let perfectMatchMemberList: [PerfectMatchMemberModel] = PerfectMatchMemberModel.mockData()
    // 에러대응 뷰
    @Published var showErrorView = false
}

extension HomeViewModel {
    
    func getUserProfile() {
        Providers.homeProvider.request(
            target: .getUserProfile,
            instance: BaseResponse<GetUserProfileResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                self.schoolName = data.schoolName
                self.nickname = data.nickname
            } else {
                self.showErrorView = true
            }
        }
    }
}
