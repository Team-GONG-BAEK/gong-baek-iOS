//
//  MyFillingViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/21/25.
//

import SwiftUI

struct myFillStatus {
    let category: String
    let status: Bool
}

class MyFillingViewModel: ObservableObject {
    @Published var activeMeetings: [Meeting] = []
    @Published var endedMeetings: [Meeting] = []
    
    @Published var isActiveEmpty: Bool = false
    @Published var isEndedEmpty: Bool = false
    
    init() {
//        getTimeTable()
    }
    
    
    //    func loadMeetings() {
    //        let allMeetings = dummyMeetings
    //
    //        self.activeMeetings = allMeetings.filter { $0.status == "RECRUITING" || $0.status == "RECRUITED" }
    //        self.endedMeetings = allMeetings.filter { $0.status == "CLOSED" }
    //
    //        isActiveEmpty = activeMeetings.isEmpty
    //        isEndedEmpty = endedMeetings.isEmpty
    //    }
    
//    func getTimeTable() {
//        Providers.fillingProvider.request(target: .getMyFilling(category: "REGISTER", status: true), instance: BaseResponse<GetTimeTableResponseDTO>.self) { response in
//            guard response.success, let timeTableResponse = response.data else {
//                print("❌ 시간표 불러오기 실패: \(response.message ?? "알 수 없는 오류")")
//                return
//            }
//        }
//    }
    
    func fetchMeetings(category: MyFillingType) {
        let dispatchGroup = DispatchGroup()
        var activeMeetings: [Meeting] = []
        var endedMeetings: [Meeting] = []
        
        
       
        // TargetType의 getMeetings의 category: MyfillType / status: Bool
        
        
        // ✅ 진행 중인 모임 요청 ->  status: true
       
        // ✅ 종료된 모임 요청 ->  status: false
    
        
        //  모든 API 요청이 끝난 후 데이터 업데이트
        //self.activeMeetings = activeMeetings
        //self.endedMeetings = endedMeetings
    }
}


