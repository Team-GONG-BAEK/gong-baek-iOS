//
//  MeetingRoomViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/22/25.
//

import SwiftUI

enum MeetingRoomAlertType {
    case error
    case fullErrorView
//    case commentReport
}

final class MeetingRoomViewModel: CommentManageable {
    @Published var meetingDetailData: GetMeetingRoomDetailsResponseDTO? = nil
    @Published var memberData: GetMeetingRoomMembersResponseDTO? = nil
    @Published var commentData: GetCommentsResponseDTO? = nil
    @Published var alertType: MeetingRoomAlertType? = nil
    
    var meetingStates: [MeetingChipState] {
        [
            RecruitingState(meetingDetailData?.status).map { .recruiting($0) },
            CategoryState(meetingDetailData?.category).map { .category($0) },
            GroupState(meetingDetailData?.groupType).map { .weekly($0) }
        ].compactMap { $0 }
    }
    
    var isCommentDisabled: Bool {
        RecruitingState(commentData?.groupStatus) == .CLOSED
    }
}

extension MeetingRoomViewModel {
    
    func fetchAllData(groupId: Int, groupType: String) {
        let dispatchGroup = DispatchGroup()
        
        var meetingDetailData: GetMeetingRoomDetailsResponseDTO? = nil
        var memberData: GetMeetingRoomMembersResponseDTO? = nil
        var commentData: GetCommentsResponseDTO? = nil
        
        dispatchGroup.enter()
        getDetails(groupId: groupId, groupType: groupType) { data in
            meetingDetailData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMembers(groupId: groupId, groupType: groupType) { data in
            memberData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getComments(groupId: groupId, groupType: groupType) { data in
            commentData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.meetingDetailData = meetingDetailData
            self.memberData = memberData
            self.commentData = commentData
        }
    }
    
    func getMembers(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingRoomMembersResponseDTO) -> ()
    ) {
        Providers.meetingRoomProvider.request(
            target: .getMembers(isPublic: false, groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetMeetingRoomMembersResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.alertType = .fullErrorView
            }
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
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.alertType = .fullErrorView
            }
        }
    }
    
    func getComments(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetCommentsResponseDTO) -> ()
    ) {
        Providers.commentProvider.request(
            target: .getComments(isPublic: false, groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetCommentsResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.alertType = .fullErrorView
            }
        }
    }
    
    func postComment(groupId: Int, groupType: String, commentContent: String) {
        let requestData = PostCommentRequestBodyDTO(
            groupId: groupId,
            groupType: groupType,
            isPublic: false,
            body: commentContent
        )
        
        Providers.commentProvider.request(
            target: .postComment(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                print("✅ 댓글 등록 성공!")
                self.getComments(groupId: groupId, groupType: groupType) { data in
                    self.commentData = data
                }
            } else {
                self.alertType = .error
                print("❌ 댓글 등록 실패: \(response.message ?? "알 수 없는 오류")")
            }
        }
    }
    
    func deleteComment(groupId: Int, groupType: String, commentId: Int) {
        let requestData = DeleteCommentRequestDTO(commentId: commentId)
        
        Providers.commentProvider.request(
            target: .deleteComment(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                print("✅ 댓글 삭제 성공!")
                self.getComments(groupId: groupId, groupType: groupType) { data in
                    self.commentData = data
                }
            } else {
                self.alertType = .error
                print("❌ 댓글 삭제 실패: \(response.message ?? "알 수 없는 오류")")
            }
        }
    }
}
