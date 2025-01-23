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
    @Published var weeklyMeetingList: [JoinableMeetingModel] = []
    // 한번봐요 모임
    @Published var oneTimeMeetingList: [JoinableMeetingModel] = []
    // 나와 딱 맞는 멤버 (API 연결 X)
    let perfectMatchMemberList: [PerfectMatchMemberModel] = PerfectMatchMemberModel.mockData()
    
    var upcomingMeetingDate: String {
        guard let data = upcomingMeetingData else { return "다가오는 모임이 없어요!" }
        let date = Date.formatDate(data.weekDate)
        let weekday = WeekDay(data.weekDay)?.koreanName ?? ""
        let startTime = Date.formatTime(data.startTime)
        let endTime = Date.formatTime(data.endTime)
        
        return date + " " + weekday + " " + startTime + " - " + endTime
    }
}

extension HomeViewModel {
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()

        var userProfile: GetUserProfileResponseDTO? = nil
        var upcomingMeeting: GetUpcomingMeetingResponseDTO? = nil
        var joinableWeeklyMeetings: GetJoinableMeetingListResponseDTO? = nil
        var joinableOneTimeMeetings: GetJoinableMeetingListResponseDTO? = nil
        
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
               let upcomingMeeting = upcomingMeeting,
               let joinableWeeklyMeetings = joinableWeeklyMeetings,
               let joinableOneTimeMeetings = joinableOneTimeMeetings {
                
                self.schoolName = userProfile.schoolName
                self.nickname = userProfile.nickname
                self.upcomingMeetingData = upcomingMeeting
                self.weeklyMeetingList = joinableWeeklyMeetings.groups
                self.oneTimeMeetingList = joinableOneTimeMeetings.groups
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
    private func getUpcomingMeeting(completion: @escaping (GetUpcomingMeetingResponseDTO) -> Void) {
        Providers.homeProvider.request(
            target: .getUpcomingMeeting,
            instance: BaseResponse<GetUpcomingMeetingResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.showErrorView = true
            }
        }
    }
    
    /// 참여 가능한 모임 리스트 조회
    private func getJoinableMeetingList(
        groupType: GroupState,
        completion: @escaping (GetJoinableMeetingListResponseDTO) -> Void
    ) {
        Providers.homeProvider.request(
            target: .getJoinableMeetingList(groupType: groupType.rawValue),
            instance: BaseResponse<GetJoinableMeetingListResponseDTO>.self
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
