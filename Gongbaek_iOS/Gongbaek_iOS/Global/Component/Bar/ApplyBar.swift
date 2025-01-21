//
//  ApplyBar.swift
//  Gongbaek_iOS
//
//  Created by 김희은 on 1/15/25.
//

import SwiftUI

// MARK: TODO - Model 분리 예정

struct ApplyModel {
    var currentPeopleCount: Int
    var maxPeopleCount: Int
    var isHost: Bool
    var meetingStatus: String
    var isApply: Bool
    var onTap: (() -> Void)?
}

struct ApplyBar: View {
    @Binding var applyData: ApplyModel
    
    //TODO: buttonText, isActivated, buttonAction ViewModel로 분리
    
    private var buttonText: String {
        if applyData.isHost {
            return "삭제하기"
        }
        
        switch RecruitingState(applyData.meetingStatus) {
        case .CLOSED:
            return "종료된 모임입니다."
        case .RECRUITED:
            return applyData.isApply ? "취소하기" : "인원 마감"
        case .RECRUITING:
            return applyData.isApply ? "취소하기" : "신청하기"
        case nil:
            return "nil"
        }
    }
    
    private var isActivated: Bool {
        if applyData.isHost {
            return true
        }
        
        switch RecruitingState(applyData.meetingStatus) {
        case .CLOSED:
            return false
        case .RECRUITED:
            return applyData.isApply
        case .RECRUITING:
            return true
        case nil:
            return false
        }
    }
    
    private var buttonAction: (() -> Void)? {
        if applyData.isHost {
            return {
                print("삭제하기 동작 수행") // 앱잼 내 구현 X
            }
        }
        
        switch RecruitingState(applyData.meetingStatus) {
        case .RECRUITING:
            return {
                if applyData.isApply {
                    print("신청 취소 처리")
                } else {
                    print("모임 신청 처리")
                }
            }
        case .RECRUITED, .CLOSED, nil:
            return nil
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(applyData.currentPeopleCount) / \(applyData.maxPeopleCount) 명")
                .pretendardFont(.title2_sb_18)
                .padding(16)
                .foregroundStyle(isActivated ? .gray01 : .grayWhite)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isActivated ? .gray09 : .gray04)
                )
            
            BasicButton(text: buttonText, isActivated: isActivated, onTap: applyData.onTap)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .background(.grayWhite)
    }
}

#Preview {
    ApplyBar(
        applyData: .constant(ApplyModel(
            currentPeopleCount: 3,
            maxPeopleCount: 4,
            isHost: false,
            meetingStatus: "RECRUITED",
            isApply: true,
            onTap: nil
        )
    ))
}
