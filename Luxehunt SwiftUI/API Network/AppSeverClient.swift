//
//  AppSeverClient.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//


import Foundation
import Alamofire
import SwiftyJSON

// MARK: - AppServerClient
class AppServerClient {
    private let baseURL: String
    class var sharedInstance: AppServerClient {
        struct Static {
            static let instance: AppServerClient! = AppServerClient()
        }
        return Static.instance
    }
    init() {
        guard let targetName = Bundle.main.infoDictionary?["CFBundleName"] as? String,
              let environment = Constants.Environments(rawValue: targetName) else {
            baseURL = Constants.Environments.prod.BaseURL
            return
        }
        baseURL = environment.BaseURL
    }
    func api<T: Decodable>(
        url: String,
        param: [String: Any]?,
        method: HTTPMethod,
        success: @escaping (T) -> Void,
        failure: @escaping (String) -> Void
    ) {

        let headers: HTTPHeaders = [
            "Authorization": UserDefaultsManager.shared.accessToken,
            "Content-Type": "application/json"
        ]

        let urlWithBase = "\(baseURL)\(url)"

        AF.request(
            urlWithBase,
            method: method,
            parameters: param,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                success(result)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }


    
    
    func getApi<T: Decodable>(url: String, success: @escaping (T) -> Void, failure: ((String?) -> Void)?) {
        let headers: HTTPHeaders = [
            "Authorization": UserDefaultsManager.shared.accessToken,
            "Content-Type": "application/json"
        ]
        
        let urlWithBase = "\(baseURL)\(url)"
        
        // Custom decoder with snake_case support
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(urlWithBase, method: .get, headers: headers)
            .validate()
            .responseData { response in
                // Print raw body for debugging
                if let data = response.data, let body = String(data: data, encoding: .utf8) {
//                    print("GET \(urlWithBase) raw response:\n\(body)")
                }
                switch response.result {
                case .success(let data):
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        success(result)
                    } catch {
                        failure?("Response could not be decoded because of error:\n\(error.localizedDescription)")
                        print("Decoding error: \(error)")
                    }
                case .failure(let error):
                    failure?(error.localizedDescription)
                    print("Failure")
                }
            }
    }

}
