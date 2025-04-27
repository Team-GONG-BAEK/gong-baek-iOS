//
//  HomeViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // 에러대응 뷰
    @Published var showErrorView = false
    // 헤더
    @Published var schoolName = ""
    @Published var nickname = ""
    @Published var upcomingMeetingData: GetUpcomingMeetingResponseDTO? = nil
    // 매주봐요 모임
    @Published var weeklyMeetingList: [JoinableMeetingModel]? = nil
    // 한번봐요 모임
    @Published var oneTimeMeetingList: [JoinableMeetingModel]? = nil
    /* 나와 딱 맞는 멤버 (추후 업데이트 예정)
    let perfectMatchMemberList: [PerfectMatchMemberModel] = PerfectMatchMemberModel.mockData()
    */
}

extension HomeViewModel {
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()

        var userProfile: GetUserProfileResponseDTO? = nil
        var upcomingMeeting: GetUpcomingMeetingResponseDTO? = nil
        var joinableWeeklyMeetings: [JoinableMeetingModel]? = nil
        var joinableOneTimeMeetings: [JoinableMeetingModel]? = nil
        
        dispatchGroup.enter()
        getUserProfile { data in
            userProfile = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getUpcomingMeeting { data in
            upcomingMeeting = data
            dispatchGroup.leave()
        }
        
        for type in GroupState.allCases {
            dispatchGroup.enter()
            getJoinableMeetingList(groupType: type) { data in
                switch type {
                case .ONCE:
                    joinableOneTimeMeetings = data
                case .WEEKLY:
                    joinableWeeklyMeetings = data
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            if let userProfile = userProfile,
               let joinableWeeklyMeetings = joinableWeeklyMeetings,
               let joinableOneTimeMeetings = joinableOneTimeMeetings {
                
                self.schoolName = userProfile.schoolName
                self.nickname = userProfile.nickname
                self.upcomingMeetingData = upcomingMeeting
                self.weeklyMeetingList = joinableWeeklyMeetings
                self.oneTimeMeetingList = joinableOneTimeMeetings
                self.showErrorView = false
            } else {
                self.showErrorView = true
            }
        }
    }
    
    /// 유저 프로필 조회 (학교명, 닉네임)
    private func getUserProfile(completion: @escaping (GetUserProfileResponseDTO) -> Void) {
        Providers.homeProvider.request(
            target: .getUserProfile,
            instance: BaseResponse<GetUserProfileResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.showErrorView = true
            }
        }
    }
    
    /// 곧 다가오는 모임 조회
    private func getUpcomingMeeting(completion: @escaping (GetUpcomingMeetingResponseDTO?) -> Void) {
        Providers.homeProvider.request(
            target: .getUpcomingMeeting,
            instance: BaseResponse<GetUpcomingMeetingResponseDTO>.self
        ) { response in
            if response.success {
                completion(response.data)
            } else {
                self.showErrorView = true
            }
        }
    }
    
    /// 참여 가능한 모임 리스트 조회
    private func getJoinableMeetingList(
        groupType: GroupState,
        completion: @escaping ([JoinableMeetingModel]) -> Void
    ) {
        Providers.homeProvider.request(
            target: .getJoinableMeetingList(groupType: groupType.rawValue),
            instance: BaseResponse<[JoinableMeetingModel]>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.showErrorView = true
            }
        }
    }
}
