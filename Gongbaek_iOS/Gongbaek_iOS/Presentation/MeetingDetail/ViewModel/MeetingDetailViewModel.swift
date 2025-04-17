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
    @Published var isSuccessGetData: Bool = true
    @Published var showApplySuccessAlert: Bool = false
    @Published var showPatchAlert: Bool = false
    @Published var showDeleteAlert: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var showFullErrorView: Bool = false
    @Published var showRecruitedAlert: Bool = false
    
    var isHost: Bool { meetingDetailData?.isHost ?? false }
    var isApply: Bool { meetingDetailData?.isApply ?? false }
    var meeting: Meeting {
        Meeting(
            groupId: meetingDetailData?.groupId ?? 0,
            status: meetingDetailData?.status ?? "",
            category: meetingDetailData?.category ?? "카테고리오류",
            coverImg: meetingDetailData?.coverImg ?? 10,
            groupType: meetingDetailData?.groupType ?? "",
            groupTitle: meetingDetailData?.groupTitle ?? "",
            weekDay: meetingDetailData?.weekDay ?? "",
            weekDate: meetingDetailData?.weekDate ?? nil,
            startTime: meetingDetailData?.startTime ?? 0,
            endTime: meetingDetailData?.endTime ?? 0,
            location: meetingDetailData?.location ?? ""
        )}
    
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
            return state == .CLOSED
            ? nil
            : { self.deleteMyMeeting(
                groupId: self.meetingDetailData?.groupId ?? 0,
                groupType: self.meetingDetailData?.groupType ?? ""
            )}
        }
        
        switch state {
        case .CLOSED:
            return nil
        case .RECRUITED:
            return isApply
            ? {self.patchApplyMeeting(
                groupId: self.meetingDetailData?.groupId ?? 0,
                groupType: self.meetingDetailData?.groupType ?? ""
            )}
            : nil
        case .RECRUITING:
            return isApply
            ? {self.patchApplyMeeting(
                groupId: self.meetingDetailData?.groupId ?? 0,
                groupType: self.meetingDetailData?.groupType ?? ""
            )}
            : {self.postApplyMeeting(
                groupId: self.meetingDetailData?.groupId ?? 0,
                groupType: self.meetingDetailData?.groupType ?? ""
            )
                self.showApplySuccessAlert = true
            }
        }
    }
}

extension MeetingDetailViewModel {
    func fetchAllData(groupId: Int, groupType: String) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getDetails(groupId: groupId, groupType: groupType) { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getOwnerInfo(groupId: groupId, groupType: groupType) { _ in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getComments(groupId: groupId, groupType: groupType) { _ in
            dispatchGroup.leave()
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
            if !response.success {
                self.showFullErrorView = true
                self.showErrorAlert = false
            }
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
            if !response.success {
                self.showFullErrorView = true
                self.showErrorAlert = false
            }
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
                    print("✅ 취소 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 취소 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.showApplySuccessAlert = true
                self.getDetails(groupId: groupId, groupType: groupType) { _ in
                    print("getDetails finished result and data: \(String(describing: self.getDetails))")
                }
            }
        }
    }
    
    func patchApplyMeeting(groupId: Int, groupType: String) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .patchApplyMeeting(
                data: requestData
            ),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    self.showPatchAlert = true
                    print("✅ 신청 성공!")
                } else {
                    if response.code == 4097 {
                        self.showRecruitedAlert = true
                        print("⚠️ 신청 불가능한 상태 (code 4097)")
                    } else {
                        self.showErrorAlert = true
                        print("❌ 신청 실패: \(response.message ?? "알 수 없는 오류")")
                    }
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
            if !response.success {
                self.showErrorAlert = true
            }
            self.commentData = response.data
            print(response)
        }
    }
    
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
                    self.showErrorAlert = false
                    print("❌ 댓글 등록 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.getComments(groupId: groupId, groupType: groupType) { _ in
                    print("getComments finished, memberData: \(String(describing: self.commentData))")
                }
            }
        }
    }
    
    func deleteMyMeeting(groupId: Int, groupType: String) {
        let requestData = PostApplyMeetingRequestBodyDTO(
            groupId: groupId,
            groupType: groupType
        )
        
        Providers.meetingDetailProvider.request(
            target: .deleteMyMeeting(
                data: requestData
            ),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            print(requestData)
            DispatchQueue.main.async {
                if response.success {
                    self.isSuccessGetData = true
                    print("✅ 삭제 성공!")
                } else {
                    self.isSuccessGetData = false
                    print("❌ 삭제 실패: \(response.message ?? "알 수 없는 오류")")
                }
                self.showDeleteAlert = true
            }
        }
    }

}
