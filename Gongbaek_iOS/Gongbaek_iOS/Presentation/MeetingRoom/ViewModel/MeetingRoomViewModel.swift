//
//  MeetingRoomViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/22/25.
//

import SwiftUI

final class MeetingRoomViewModel: ObservableObject {
    @Published var meetingDetailData: GetMeetingRoomDetailsResponseDTO? = nil
    @Published var memberData: GetMeetingRoomMembersResponseDTO? = nil
    @Published var commentData: GetMeetingRoomCommentsResponseDTO? = nil
    
    var meetingStates: [MeetingChipState] {
        [
            RecruitingState(meetingDetailData?.status).map { .recruiting($0) },
            CategoryState(meetingDetailData?.category).map { .category($0) },
            GroupState(meetingDetailData?.groupType).map { .weekly($0) }
        ].compactMap { $0 }
    }
    
    var groupTitle: String {
        meetingDetailData?.groupTitle ?? ""
    }
    
    var weekDay: String {
        meetingDetailData?.weekDay ?? ""
    }
    
    var weekDate: String {
        meetingDetailData?.weekDate ?? ""
    }
    
    var startTime: Double {
        meetingDetailData?.startTime ?? 0
    }
    
    var endTime: Double {
        meetingDetailData?.endTime ?? 0
    }
    
    var location: String {
        meetingDetailData?.location ?? ""
    }
    
    var memberCount: String {
        let current = meetingDetailData?.currentPeopleCount ?? 0
        let max = meetingDetailData?.maxPeopleCount ?? 0
        return "멤버 (\(current)/\(max)명)"
    }
    
    var isCommentDisabled: Bool {
        RecruitingState(commentData?.groupStatus) == .CLOSED
    }
    
    //TODO: 댓글 작성 API 로직 필요
    func postComment(content: String, completion: @escaping (Bool) -> Void) {
    }
}

extension MeetingRoomViewModel {
    func getMembers(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomMembersResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getMembers(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomMembersResponseDTO>.self
        ) { response in
            print(response)
            self.memberData = response.data
        }
    }
    
    func getDetails(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomDetailsResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getMeetingDetails(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomDetailsResponseDTO>.self
        ) { response in
            print(response)
            self.meetingDetailData = response.data
        }
    }
    
    func getComments(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomCommentsResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getComments(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomCommentsResponseDTO>.self
        ) { response in
            print(response)
            self.commentData = response.data
        }
    }
}
