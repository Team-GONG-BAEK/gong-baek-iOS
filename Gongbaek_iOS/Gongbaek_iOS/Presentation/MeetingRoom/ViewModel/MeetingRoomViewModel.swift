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
    
}
