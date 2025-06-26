//
//  MeetingDetailViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

enum MeetingDetailAlertType {
    case apply
    case recruited
    case cancel
    case delete
    case error
    case fullErrorView
    case meetingReport
}

final class MeetingDetailViewModel: CommentManageable {
    @Published var meetingDetailData: GetMeetingDetailsResponseDTO? = nil
    @Published var ownerInfoData: GetOwnerInfoResponseDTO? = nil
    @Published var commentData: GetCommentsResponseDTO? = nil
    @Published var alertType: MeetingDetailAlertType? = nil
    @Published var isDeletedHost: Bool = false
    
    func meeting(for meetingDetailData: GetMeetingDetailsResponseDTO) -> Meeting {
        return Meeting(
            groupId: meetingDetailData.groupId,
            status: meetingDetailData.status,
            category: meetingDetailData.category,
            coverImg: meetingDetailData.coverImg,
            groupType: meetingDetailData.groupType,
            groupTitle: meetingDetailData.groupTitle,
            weekDay: meetingDetailData.weekDay,
            weekDate: meetingDetailData.weekDate,
            startTime: meetingDetailData.startTime,
            endTime: meetingDetailData.endTime,
            location: meetingDetailData.location
        )
    }
    
    // MARK: - Button Logic 처리
    
    func buttonText(for meetingDetailData: GetMeetingDetailsResponseDTO) -> String {
        guard let state = RecruitingState(meetingDetailData.status) else { return "" }
        
        if meetingDetailData.isHost {
            return state == .CLOSED ? "종료된 모임입니다." : "삭제하기"
        }
        
        switch state {
        case .CLOSED:
            return "종료된 모임입니다."
        case .RECRUITED:
            return  meetingDetailData.isApply ? "신청 취소하기" : "인원 마감"
        case .RECRUITING:
            return meetingDetailData.isApply ? "신청 취소하기" : "신청하기"
        }
    }
    
    func isActivated(for meetingDetailData: GetMeetingDetailsResponseDTO) -> Bool {
        guard let state = RecruitingState(meetingDetailData.status) else { return false }
        
        if meetingDetailData.isHost {
            return state != .CLOSED
        }
        
        switch state {
        case .CLOSED:
            return false
        case .RECRUITED:
            return meetingDetailData.isApply
        case .RECRUITING:
            return true
        }
    }
    
    func buttonAction(for meetingDetailData: GetMeetingDetailsResponseDTO) -> (() -> (Void))? {
        guard let state = RecruitingState(meetingDetailData.status) else { return nil }
        
        if meetingDetailData.isHost {
            return state == .CLOSED
            ? nil
            : { self.alertType = .delete }
        }
        
        switch state {
        case .CLOSED:
            return nil
        case .RECRUITED:
            return meetingDetailData.isApply
            ? { self.patchApplyMeeting(
                groupId: meetingDetailData.groupId,
                groupType: meetingDetailData.groupType
            )}
            : nil
        case .RECRUITING:
            return meetingDetailData.isApply
            ? { self.patchApplyMeeting(
                groupId: meetingDetailData.groupId,
                groupType: meetingDetailData.groupType
            )}
            : { self.postApplyMeeting(
                groupId: meetingDetailData.groupId,
                groupType: meetingDetailData.groupType
            )}
        }
    }
}

extension MeetingDetailViewModel {
    
    func fetchAllData(groupId: Int, groupType: String) {
        let dispatchGroup = DispatchGroup()
        
        var meetingDetailData: GetMeetingDetailsResponseDTO? = nil
        var ownerInfoData: GetOwnerInfoResponseDTO? = nil
        var commentData: GetCommentsResponseDTO? = nil
        
        dispatchGroup.enter()
        getDetails(groupId: groupId, groupType: groupType) { data in
            meetingDetailData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getOwnerInfo(groupId: groupId, groupType: groupType) { data in
            ownerInfoData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getComments(groupId: groupId, groupType: groupType) { data in
            commentData = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.meetingDetailData = meetingDetailData
            self.ownerInfoData = ownerInfoData
            self.commentData = commentData
        }
    }
    
    func getDetails(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetMeetingDetailsResponseDTO) -> ()
    ) {
        Providers.meetingDetailProvider.request(
            target: .getMeetingDetails(
                isPublic: true,
                groupId: groupId,
                groupType: groupType
            ),
            instance: BaseResponse<GetMeetingDetailsResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                self.alertType = .fullErrorView
            }
        }
    }
    
    func getOwnerInfo(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetOwnerInfoResponseDTO?) -> ()
    ) {
        Providers.meetingDetailProvider.request(
            target: .getOwnerInfo(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetOwnerInfoResponseDTO>.self
        ) { response in
            if response.success {
                guard let data = response.data else { return }
                completion(data)
            } else {
                switch response.code {
                case 4042:
                    self.isDeletedHost = true
                    completion(nil)
                default:
                    self.alertType = .fullErrorView
                }
            }
        }
    }
    
    func getComments(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetCommentsResponseDTO) -> ()
    ) {
        Providers.commentProvider.request(
            target: .getComments(
                isPublic: true,
                groupId: groupId,
                groupType: groupType
            ),
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
    
    func postApplyMeeting(groupId: Int, groupType: String) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .postApplyMeeting(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                self.alertType = .apply
                print("✅ 신청 성공!")
            } else {
                switch response.code {
                case 4097:
                    self.alertType = .recruited
                    print("⚠️ 신청 불가능한 상태 - 인원마감 (code: 4097)")
                default:
                    self.alertType = .error
                    print("❌ 신청 실패: \(response.message ?? "알 수 없는 오류")")
                }
            }
            
            self.getDetails(groupId: groupId, groupType: groupType) { data in
                self.meetingDetailData = data
            }
        }
    }
    
    func patchApplyMeeting(groupId: Int, groupType: String) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .patchApplyMeeting(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                self.alertType = .cancel
                print("✅ 취소 성공!")
            } else {
                self.alertType = .error
                print("❌ 취소 실패: \(response.message ?? "알 수 없는 오류")")
            }
            
            self.getDetails(groupId: groupId, groupType: groupType) { data in
                self.meetingDetailData = data
            }
        }
    }
    
    func postComment(groupId: Int, groupType: String, commentContent: String) {
        let requestData = PostCommentRequestBodyDTO(
            groupId: groupId,
            groupType: groupType,
            isPublic: true,
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
    
    func deleteMyMeeting(
        groupId: Int,
        groupType: String,
        completion: @escaping () -> ()
    ) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .deleteMyMeeting(data: requestData),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                print("✅ 삭제 성공!")
                completion()
            } else {
                self.alertType = .error
                print("❌ 삭제 실패: \(response.message ?? "알 수 없는 오류")")
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
