//
//  SignupViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI

final class SignupViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // 프로필 선택
    @Published var profileImageIndex: Int? = nil
    // 닉네임 입력
    @Published var nickname = ""
    @Published var showNicknameError = false
    // 학교학과 입력
    @Published var schoolName = ""
    @Published var majorName = ""
    // 학교학과 검색
    @Published var selectedSearchResult: String = ""
    @Published var textFieldText = ""
    @Published var searchWord = ""
    @Published var searchResultList: [String] = []
    // 학년입학연도 입력
    @Published var grade: GradeState? = nil
    @Published var yearOfAdmission: Int? = nil
    // MBTI 입력
    @Published var e_i: MBTI_ei? = nil
    @Published var s_n: MBTI_sn? = nil
    @Published var t_f: MBTI_tf? = nil
    @Published var j_p: MBTI_jp? = nil
    // 성별 선택
    @Published var sex: SexType? = nil
    // 자기소개글 작성
    @Published var introduction: String = ""
    // 수업시간표 입력
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    
    @Published var showAlert: Bool = false
    
    // MARK: - Methods
    
    func isNextButtonEnabled(_ step: SignupStep) -> Bool {
        switch step {
        case .profileSelection:
            return profileImageIndex != nil
        case .nicknameInput:
            return !nickname.isEmpty
        case .schoolMajorInput:
            return !schoolName.isEmpty && !majorName.isEmpty
        case .gradeAdmissionYearInput:
            return grade != nil && yearOfAdmission != nil
        case .mbtiSelection:
            return e_i != nil && s_n != nil && t_f != nil && j_p != nil
        case .sexSelection:
            return sex != nil
        case .selfIntroductionWriting:
            return !introduction.isEmpty
        case .classTimeTableInput:
            return !selectedCells.isEmpty
        case .freeTimeTableConversion, .signupCompletion:
            return true
        }
    }
    
    /// 학교학과 검색 화면 프로퍼티 초기화
    func resetSearchState() {
        selectedSearchResult = ""
        textFieldText = ""
        searchWord = ""
        searchResultList = []
    }
    
    /// 상태값 초기화 (다음 화면으로 이동 시 기존 값들 리셋)
    func resetState(at step: SignupStep) {
        switch step {
        case .nicknameInput:
            nickname = ""
            showNicknameError = false
        case .schoolMajorInput:
            schoolName = ""
            majorName = ""
        case .gradeAdmissionYearInput:
            grade = nil
            yearOfAdmission = nil
        case .mbtiSelection:
            e_i = nil
            s_n = nil
            t_f = nil
            j_p = nil
        case .sexSelection:
            sex = nil
        case .selfIntroductionWriting:
            introduction = ""
        case .classTimeTableInput:
            selectedCells = []
            classTimeTable = []
        default:
            return
        }
    }
    
    func convertToTimeTableModel() -> [TimeTableRequestModel] {
        return classTimeTable.map {
            TimeTableRequestModel(
                weekDay: $0.day.rawValue,
                startTime: $0.start,
                endTime: $0.end
            )
        }
    }
}

extension SignupViewModel {
    
    /// 닉네임 검증 API
    func postNicknameValidation(completion: @escaping (Bool) -> ()) {
        Providers.SignupProvider.request(
            target: .postNicknameValidation(nickname: nickname),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                self.showAlert = false
                completion(true)
            } else {
                switch response.code {
                case 4092:
                    /// 닉네임 중복 에러
                    completion(false)
                case 4000..<5000:
                    print(response.message ?? "❗️유효하지 않은 요청")
                    completion(false)
                default:
                    print("❗️서버 통신 에러 발생")
                    completion(false)
                }
                self.showAlert = true
            }
        }
    }
    
    /// 학교 검색 API
    /// 학교 검색 API
    func getSchoolSearchResults(completion: @escaping (Bool) -> ()) {
        Providers.SignupProvider.request(
            target: .getSchoolSearchResults(schoolName: searchWord),
            instance: BaseResponse<GetSchoolSearchResponseDTO>.self
        ) { response in
            print(response)
            if response.success {
                self.showAlert = true
                guard let data = response.data else { return }
                self.searchResultList = data.schoolNames
            } else {
                self.showAlert = true
            }
        }
    }
    
    /// 학과 검색 API
    func getMajorSearchResults(completion: @escaping (Bool) -> ()) {
        Providers.SignupProvider.request(
            target: .getMajorSearchResults(
                schoolName: schoolName,
                majorName: searchWord
            ),
            instance: BaseResponse<GetMajorSearchResponseDTO>.self
        ) { response in
            print(response)
            if response.success {
                self.showAlert = false
                guard let data = response.data else { return }
                self.searchResultList = data.schoolMajors
            }
        }
    }
    
    /// 회원가입 API
    func postSignup(completion: @escaping (Bool) -> ()) {
        guard let profileImage = profileImageIndex,
              let grade = grade,
              let gradeInt = GradeState.allCases.firstIndex(of: grade),
              let yearOfAdmission = yearOfAdmission,
              let e_i, let s_n, let t_f, let j_p,
              let sex = sex
        else { return }
        
        let data = PostSignupRequestDTO(
            profileImg: profileImage + 1,
            nickname: nickname,
            mbti: e_i.rawValue + s_n.rawValue + t_f.rawValue + j_p.rawValue,
            schoolName: schoolName,
            schoolMajor: majorName,
            schoolGrade: gradeInt,
            enterYear: yearOfAdmission,
            introduction: introduction,
            sex: sex.rawValue,
            timeTable: convertToTimeTableModel()
        )
        
        Providers.SignupProvider.request(
            target: .postSignup(data: data),
            instance: BaseResponse<PostSignupResponseDTO>.self
        ) { response in
            if response.success {
                self.showAlert = false

                guard let accessToken = response.data?.accessToken,
                      let refreshToken = response.data?.refreshToken
                else { return }
                
                TokenManager.shared.updateToken(accessToken, refreshToken)
                completion(true)
            } else {
                self.showAlert = true
                completion(false)
            }
        }
    }
}
