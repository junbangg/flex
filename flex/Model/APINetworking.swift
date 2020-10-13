//
//  Networking.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/27.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation
import Combine

// MARK: - Protocols
protocol APIRequests {
    //Login
    func login(email: String, password: String)-> AnyPublisher<APIResponse, APIError>
    //Get Data
    func getUserData(userID: Int, token: String)-> AnyPublisher<ProfileResponse, APIError>
    
}
// MARK: - Main Class
class APINetworking {
    private let session : URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}
// MARK: - Fetching Data
extension APINetworking : APIRequests {
    
    func login(email: String, password: String) -> AnyPublisher<APIResponse, APIError> {
        return fetch(with: prepareForLogin(email: email, password: password))
    }
    func getUserData(userID: Int, token: String) -> AnyPublisher<ProfileResponse, APIError> {
        return fetch(with: prepareForUserData(userID: userID, token: token))
    }
    private func fetch<T> (with request : URLRequest) ->AnyPublisher<T, APIError> where T : Decodable{
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                .badRequest(error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
        }
        .eraseToAnyPublisher()
        
    }
}
// MARK: -URL components
private extension APINetworking {
    
    //http://localhost:3000/api/users/
    struct BaseAPI {
        static let baseURL : String = "http://localhost:3000/api/users/"
    }
    func prepareForLogin(email: String, password: String) -> URLRequest {
        let url = URL(string: BaseAPI.baseURL+"login")!
        let params = ["email": email, "password": password]
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        loginRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error{
            print(error.localizedDescription)
        }
        return loginRequest
    }
    func prepareForUserData(userID: Int, token: String) -> URLRequest{
        let url = URL(string: BaseAPI.baseURL + String(userID))!
//        let params = ["id" : userID]
        var dataRequest = URLRequest(url: url)
        dataRequest.httpMethod = "GET"
        dataRequest.addValue(token, forHTTPHeaderField: "Authorization")
        dataRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        do {
//            dataRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
//        } catch let error{
//            print(error.localizedDescription)
//        }
        return dataRequest
    }
}
