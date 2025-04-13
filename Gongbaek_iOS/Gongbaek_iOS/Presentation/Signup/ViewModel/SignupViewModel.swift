//
//  SignupViewModel.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/21/25.
//

import SwiftUI
import Combine

final class SignupViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // 학적정보 입력
    @Published var schoolName = ""
    @Published var majorName = ""
    @Published var yearOfAdmission: Int? = nil
    // 학교, 학과 검색
    @Published var selectedSearchResult = ""
    @Published var textFieldText = ""
    @Published var searchWord = ""
    @Published var searchResultList: [String] = []
    // 이메일 인증
    @Published var email = ""
    @Published var verificationCode = ""
    @Published var isEmailVerified: Bool = true
    @Published var emailStatus: TextFieldType.EmailStatus? = nil
    @Published var verificationStatus: TextFieldType.VerificationStatus? = nil
    @Published var isVerifyButtonDisabled: Bool = true
    // 타이머
    @Published var isTimerVisible = false
    private let totalSeconds: Int = 180
    @Published var remainingTime: Int = 0
    private var cancellable: AnyCancellable?
    // 닉네임, 성별 입력
    @Published var nickname = ""
    @Published var nicknameStatus: TextFieldType.NicknameStatus? = nil
    @Published var sex: SexType? = nil
    // 프로필 이미지 선택
    @Published var profileImageIndex: Int? = nil
    // MBTI 입력
    @Published var e_i: MBTI_ei? = nil
    @Published var s_n: MBTI_sn? = nil
    @Published var t_f: MBTI_tf? = nil
    @Published var j_p: MBTI_jp? = nil
    // 자기소개글 작성
    @Published var introduction: String = ""
    // 시간표 입력
    @Published var selectedCells: Set<TimeTableCellId> = []
    @Published var classTimeTable: [(day: WeekDay, start: Double, end: Double)] = []
    // 에러
    @Published var showAlert: Bool = false

    
    // MARK: - Methods
    
    func isNextButtonEnabled(_ step: SignupStep) -> Bool {
        switch step {
        case .academicInfoInput:
            return !schoolName.isEmpty && !majorName.isEmpty && yearOfAdmission != nil
        case .schoolEmailVerification:
            return isEmailVerified
        case .nicknameSexInput:
            return nickname.count > 1 && sex != nil
        case .profileImageSelection:
            return profileImageIndex != nil
        case .mbtiSelection:
            return e_i != nil && s_n != nil && t_f != nil && j_p != nil
        case .selfIntroductionWriting:
            return introduction.count >= 20
        case .classTimeTableInput:
            return !selectedCells.isEmpty
        case .signupCompletion:
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
        case .academicInfoInput:
            schoolName = ""
            majorName = ""
            yearOfAdmission = nil
        case .schoolEmailVerification:
            email = ""
            isEmailVerified = false
            emailStatus = nil
            verificationStatus = nil
        case .nicknameSexInput:
            nickname = ""
            sex = nil
            nicknameStatus = nil
        case .profileImageSelection:
            profileImageIndex = nil
        case .mbtiSelection:
            e_i = nil
            s_n = nil
            t_f = nil
            j_p = nil
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
                weekDay: $0.day.englishName,
                startTime: $0.start,
                endTime: $0.end
            )
        }
    }
        
    /// 선택된 셀들 수업 시간표 모델 데이터로 변환
    private func saveSelectedCellsToClassTimeTable() {
        classTimeTable.removeAll()
        
        // dayIndex -> 요일별로 그룹화
        // hourIndex -> 오름차순 정렬
        let groupedCells = Dictionary(grouping: selectedCells) { $0.dayIndex }
            .mapValues { cells in
                cells.sorted(by: {
                    $0.hourIndex < $1.hourIndex
                })
            }

        // 요일 그룹 순서대로 연속적인 수업 시간 계산
        for (dayIndex, cells) in groupedCells {
            var startTime: Double?
            var endTime: Double?
            
            for cell in cells {
                if let currentEnd = endTime,
                    currentEnd == cell.hourIndex {
                    // 현재 endTime과 연속적인 cell일 경우
                    endTime = cell.hourIndex + 0.5
                } else {
                    // 불연속일 땐 지금까지 저장해둔 거 append
                    if let s = startTime,
                        let e = endTime {
                        classTimeTable.append((day: WeekDay.allCases[dayIndex], start: s, end: e))
                    }
                    // 다시 시작! 현재 cell 시작/종료 시간 저장
                    startTime = cell.hourIndex
                    endTime = cell.hourIndex + 0.5
                }
            }
            
            // 마지막 남은 범위 추가
            if let s = startTime, let e = endTime {
                classTimeTable.append((day: WeekDay.allCases[dayIndex], start: s, end: e))
            }
        }
    }
    
    func startTimer() {
        cancellable?.cancel()
        remainingTime = totalSeconds
        
        cancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.cancellable?.cancel()
                }
            }
    }
    
    func stopTimer() {
        cancellable?.cancel()
    }
    
    func formattedTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /// 완전한 한글 음절로만 이루어져 있는지 확인
    func isOnlyCompleteHangulSyllables(_ text: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[가-힣]+$")
        return regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)) != nil
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
                print(response.code,"🚨")
                switch response.code {
                case 409:
                    /// 닉네임 중복 에러
                    self.showAlert = false
                    completion(false)
                case 400..<500:
                    self.showAlert = false
                    print(response.message ?? "❗️유효하지 않은 요청")
                default:
                    self.showAlert = true
                    print("❗️서버 통신 에러 발생")
                }
            }
        }
    }
    
    /// 학교 검색 API
    func getSchoolSearchResults() {
        Providers.SignupProvider.request(
            target: .getSchoolSearchResults(schoolName: searchWord),
            instance: BaseResponse<GetSchoolSearchResponseDTO>.self
        ) { response in
            print(response)
            if response.success {
                self.showAlert = false
                guard let data = response.data else { return }
                self.searchResultList = data.schoolNames
            } else {
                self.showAlert = true
            }
        }
    }
    
    /// 학과 검색 API
    func getMajorSearchResults() {
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
            } else {
                self.showAlert = true
            }
        }
    }
    
    /// 학교 이메일 인증코드 전송 API
    func postSendEmailVerificationCode() {
        // TODO: 이메일 정규식 검사(학교 이메일 형식 다양한 걸로 테스트 필수)
        
        Providers.SignupProvider.request(
            target: .postSendEmailVerificationCode(email: email, schoolName: schoolName),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
//                self.showAlert = true
                // TODO: 회원가입 api 호출하는 화면인지에 따라 alert 내용 바꿔야 할듯...
                self.startTimer()
                self.isTimerVisible = true
                self.isVerifyButtonDisabled = false
            } else {
                
            }
        }
    }
    
    /// 학교 이메일 인증  API
    func getSchoolEmailCodeVerification() {
        Providers.SignupProvider.request(
            target: .getSchoolEmailVerification(
                email: email,
                schoolName: schoolName,
                code: verificationCode
            ),
            instance: BaseResponse<EmptyResponseDTO>.self
        ) { response in
            if response.success {
                self.isEmailVerified = true
            } else {
                
            }
        }
    }
    
    /// 회원가입 API
    func postSignup(completion: @escaping (Bool) -> ()) {
        guard let yearOfAdmission = yearOfAdmission,
              let sex = sex,
              let profileImage = profileImageIndex,
              let e_i, let s_n, let t_f, let j_p
        else { return }
        saveSelectedCellsToClassTimeTable()
        
        let data = PostSignupRequestDTO(
            profileImg: profileImage,
            nickname: nickname,
            mbti: e_i.rawValue + s_n.rawValue + t_f.rawValue + j_p.rawValue,
            schoolName: schoolName,
            schoolMajor: majorName,
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
