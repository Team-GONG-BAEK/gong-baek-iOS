//
//  MeetingDetailViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/19/25.
//

import SwiftUI

class MeetingDetailViewModel: ObservableObject {
    @Published var meetingDetailData: GetMeetingDetailsResponseDTO? = nil
    @Published var ownerInfoData: GetOwnerInfoResponseDTO? = nil
    @Published var commentData: GetCommentsResponseDTO? = nil
    
    
    var isHost: Bool { meetingDetailData?.isHost ?? false }
    var isApply: Bool { meetingDetailData?.isApply ?? false }
    var meeting: Meeting {
        Meeting(
            groupId: 0, status: meetingDetailData?.status ?? "",
            category: meetingDetailData?.category ?? "",
            coverImg: 5,
            groupType: meetingDetailData?.groupType ?? "",
            groupTitle: meetingDetailData?.groupTitle ?? "",
            weekDay: meetingDetailData?.weekDay ?? "",
            weekDate: meetingDetailData?.weekDate ?? "",
            startTime: meetingDetailData?.startTime ?? 0,
            endTime: meetingDetailData?.endTime ?? 0,
            location: meetingDetailData?.location ?? ""
        )}
    
    @Published var isSuccessGetData: Bool = true
    
    // MARK: - Button Logic 처리
    
    var buttonText: String {
        guard let state = RecruitingState(meetingDetailData?.status ?? "") else {
            return "알 수 없는 상태"
        }
        
        if isHost {
            return state == .CLOSED ? "종료된 모임입니다." : "삭제하기"
        }
        
        switch state {
        case .CLOSED:
            return "종료된 모임입니다."
        case .RECRUITED:
            return  isApply ? "취소하기" : "인원 마감"
        case .RECRUITING:
            return isApply ? "취소하기" : "신청하기"
        }
    }
    
    var isActivated: Bool {
        guard let state = RecruitingState(meetingDetailData?.status) else {
            return false
        }
        
        if isHost {
            return state != .CLOSED
        }
        
        switch state {
        case .CLOSED:
            return false
        case .RECRUITED:
            return isApply
        case .RECRUITING:
            return true
        }
    }
    
    var buttonAction: (() -> Void)? {
        guard let state = RecruitingState(meetingDetailData?.status) else {
            return nil
        }
        
        if isHost {
            return state == .CLOSED ? nil : { print("삭제하기 처리") } //TODO: viewModel에서 action으로 변경
        }
        
        switch state {
        case .CLOSED:
            return nil
        case .RECRUITED:
            return isApply ? { print("신청 취소 처리") } : nil
        case .RECRUITING:
            return isApply ? { print("신청 취소 처리") } :{
                self.postApplyMeeting(
                    groupId: self.meetingDetailData?.groupId ?? 0,
                    groupType: self.meetingDetailData?.groupType ?? ""
                )
            }
        }
    }
}
                      


extension MeetingDetailViewModel {
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
            print(response)
            self.meetingDetailData = response.data
        }
    }
    
    
    func getOwnerInfo(
        groupId: Int,
        groupType: String,
        completion: @escaping (GetOwnerInfoResponseDTO) -> ()
    ) {
        Providers.meetingDetailProvider.request(
            target: .getOwnerInfo(groupId: groupId, groupType: groupType),
            instance: BaseResponse<GetOwnerInfoResponseDTO>.self
        ) { response in
            print(response)
            self.ownerInfoData = response.data
        }
    }
    
    func postApplyMeeting(groupId: Int, groupType: String) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .postApplyMeeting(
                data: requestData
            ),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    print("✅ 신청 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 신청 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.getDetails(groupId: groupId, groupType: groupType) { _ in
                    print("getDetails finished result and data: \(String(describing: self.getDetails))")
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
            print(response)
            self.commentData = response.data
        }
    }
    
    //TODO: 댓글 작성 API 로직 필요
    func postComment(groupId: Int, groupType: String, commentContent: String) {
        let requestData = PostCommentRequestBodyDTO(
            groupId: groupId,
            groupType: groupType,
            isPublic: true,
            body: commentContent
        )
        
        Providers.commentProvider.request(target: .postComment(data: requestData), instance: BaseResponse<EmptyResponseDTO>.self) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    print("✅ 댓글 등록 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 댓글 등록 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.getComments(groupId: groupId, groupType: groupType) { _ in
                    print("getComments finished, memberData: \(String(describing: self.commentData))")
                }
            }
        }
    }
}
