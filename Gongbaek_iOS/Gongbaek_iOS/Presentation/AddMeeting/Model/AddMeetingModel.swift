//
//  AddMeetingModel.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/18/25.
//

import SwiftUI

struct AddMeetingModel {
    var groupType: CycleState
    var weekDate: String?
    var weekDay: String
    var startTime: Double
    var endTime: Double
    var dueDate: String
    var category: Category
    var coverImg: Int
    var location: String
    var maxPeopleCount: Int
    var groupTitle: String
    var introduction: String
}

