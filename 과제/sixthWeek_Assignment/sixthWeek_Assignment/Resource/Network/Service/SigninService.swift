//
//  SigninService.swift
//  sixthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/27.
//


import Foundation
import Alamofire



struct SigninService {
    static let shared = SigninService()
    

    private func makeParameters(email : String, pw : String) -> Parameters
    {
        return
            [
                "email" : email,
                "password" : pw
        
            ]
    }
    
    
        

    func signin(email: String,pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {
            
            
            
            
            let header: HTTPHeaders = ["content-Type": "application/json"]
        let url = APIConstants.signinURL
           
        
     
            let dataRequest = AF.request(url, method : .post,
                                         parameters: makeParameters(email: email, pw: pw),
                 encoding:
                JSONEncoding.default, headers: header)
            
            
            
            dataRequest.responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    

                    let networkResult = self.judge(by: statusCode)
                    completion(networkResult)
                case .failure: completion(.networkFail)
                }
            }
        }
    
    

        
        
        private func judge(by statusCode: Int) -> NetworkResult<Any>  {
            switch statusCode {
                
            case 200...299: return .success("_")
            case 400...499: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }
        
        
        

}
