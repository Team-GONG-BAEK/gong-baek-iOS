//
//  MeetingRoomViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/22/25.
//

import SwiftUI

class MeetingRoomViewModel: ObservableObject {
    
    @Published var meetingDetailData: MeetingDetailModel = dummymeetingDetailData
    
    @Published var memberData: MeetingRoomMemberModel = dummyMeetingRoomMemberData
    
    @Published var commentData: CommentModel = dummyCommentData
    
    var meetingStates: [MeetingChipState] {
        [
            RecruitingState(meetingDetailData.status).map { .recruiting($0) },
            CategoryState(meetingDetailData.category).map { .category($0) },
            GroupState(meetingDetailData.groupType).map { .weekly($0) }
        ].compactMap { $0 }
    }
    
    var memberCount: String {
        "멤버(\(meetingDetailData.currentPeopleCount)/\(meetingDetailData.maxPeopleCount)명)"
    }
    
    var isCommentDisabled: Bool {
        RecruitingState(commentData.groupStatus) == .CLOSED
    }
    
    //TODO: 댓글 작성 API 로직 필요
    func postComment(content: String, completion: @escaping (Bool) -> Void) {
    }
}
