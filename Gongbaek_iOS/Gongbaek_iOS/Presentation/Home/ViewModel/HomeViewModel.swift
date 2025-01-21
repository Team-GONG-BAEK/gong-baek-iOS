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
    @Published var nickname = "아요옹나요옹뾰오옹"
    // 매주봐요 모임
    @Published var weeklyMeetingList: [MeetingModel] = MeetingModel.weeklyMeetingList()
    // 한번봐요 모임
    @Published var oneTimeMeetingList: [MeetingModel] = MeetingModel.weeklyMeetingList()
}
