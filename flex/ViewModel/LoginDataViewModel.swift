//
//  ProfileDataViewModel.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/28.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

//Might have to change all types to optionals
import Foundation

struct LoginDataViewModel: Identifiable {
    private let response : APIResponse
    
    var id: Int {
        return response.results!.profile.userId
    }
    var status: Int {
        return response.status
    }
    var token: String? {
        return response.results!.token!
    }
    var username: String {
        return response.results!.profile.username
    }
    var intro: String? {
        return (response.results?.profile.intro)!
    }
    var profileImage: String? {
        return response.results!.profile.profileImage!
    }
    
    init(response: APIResponse) {
        self.response = response
    }
    
}

//struct ProfileDataViewModel {
//    private let response : APIResponse
//
//    var status: Int {
//        return response.status
//    }
//    var token: String {
//        return response.results.token
//    }
//    var username: String {
//        return response.results.profile.username
//    }
//    var intro: String {
//        return response.results.profile.intro
//    }
//    var profileImage: String {
//        return response.results.profile.profileImage
//    }
//
//    init(response: APIResponse) {
//        self.response = response
//    }
//
//
//
//}
