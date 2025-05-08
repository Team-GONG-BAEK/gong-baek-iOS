//
//  NetworkProvider.swift
//  Gongbaek_iOS
//
//  Created by 김나연 on 1/12/25.
//

import Foundation

import Moya

class NetworkProvider<Provider : TargetType> : MoyaProvider<Provider> {
    
    func request<Model : Codable>(
        target : Provider,
        instance : BaseResponse<Model>.Type ,
        completion : @escaping(BaseResponse<Model>) -> ()
    ){
        self.request(target) { result in
            switch result {
            case .success(let response):
                if (200..<300).contains(response.statusCode) {
                    let decodedResponse = self.decodeOrFallbackData(instance, from: response.data)
                    completion(decodedResponse)
                } else {
                    print("🚨 Client Error")
                }
                
            /// 400-500 에러
            case .failure(let error):
                if let response = error.response {
                    let decodedResponse = self.decodeOrFallbackData(instance, from: response.data)
                    completion(decodedResponse)
                } else {
                    /// 네트워크 오류
                    let decodedResponse = BaseResponse<Model>(
                        success: false,
                        code: -1,
                        message: "",
                        data: nil
                    )
                    completion(decodedResponse)
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension NetworkProvider {
    
    func decodeOrFallbackData<Model: Codable>(
        _ type: BaseResponse<Model>.Type,
        from data: Data
    ) -> BaseResponse<Model> {
        if let decodedData = try? JSONDecoder().decode(type, from: data) {
            return decodedData
        } else {
            print("🚨 Decoding Error 발생")
            return BaseResponse<Model>(
                success: false,
                code: 0,
                message: "",
                data: nil
            )
        }
    }
}
