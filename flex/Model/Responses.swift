//
//  Responses.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/27.
//  Copyright © 2020 Jun Bang. All rights reserved.
//


//Might have to change all types to optionals
import Foundation

struct APIResponse : Codable {

    let status : Int
    let message : String
    let results : ResultData?

    struct ResultData : Codable {

        let profile : UserProfile
        let token : String

        enum CodingKeys: String, CodingKey {
            case profile = "profile"
            case token = "token"
        }


    }
    struct UserProfile : Codable {

        let email : String
        let intro : String?
        let profileImage : String?
        let userId : Int
        let username : String

        enum CodingKeys: String, CodingKey {
            case email = "email"
            case intro = "intro"
            case profileImage = "profile_image"
            case userId = "user_id"
            case username = "username"
        }


    }


    enum CodingKeys: String, CodingKey {
        case message = "message"
        case results = "results"
        case status = "status"
    }


}

//import Foundation
//
//struct APIResponse : Codable {
//
//    let status : Int
//    let message : String
//    let results : ResultData
//
//
//    enum CodingKeys: String, CodingKey {
//        case message = "message"
//        case results = "results"
//        case status = "status"
//    }
//
////    init(from decoder: Decoder) throws {
////        let values = try decoder.container(keyedBy: CodingKeys.self)
////        message = try values.decodeIfPresent(String.self, forKey: .message)
////        results = try ResultData(from: decoder)
////        status = try values.decodeIfPresent(Int.self, forKey: .status)
////    }
//
//}
//
//struct ResultData : Codable {
//
//    let profile : UserProfile
//    let token : String
//
//    enum CodingKeys: String, CodingKey {
//        case profile = "profile"
//        case token = "token"
//    }
//
////    init(from decoder: Decoder) throws {
////        let values = try decoder.container(keyedBy: CodingKeys.self)
////        profile = try UserProfile(from: decoder)
////        token = try values.decodeIfPresent(String.self, forKey: .token)
////    }
//
//}
//
//
//struct UserProfile : Codable {
//
//    let email : String
//    let intro : String
//    let profileImage : String
//    let userId : Int
//    let username : String
//
//    enum CodingKeys: String, CodingKey {
//        case email = "email"
//        case intro = "intro"
//        case profileImage = "profile_image"
//        case userId = "user_id"
//        case username = "username"
//    }
//
////    init(from decoder: Decoder) throws {
////        let values = try decoder.container(keyedBy: CodingKeys.self)
////        email = try values.decodeIfPresent(String.self, forKey: .email)
////        intro = try values.decodeIfPresent(String.self, forKey: .intro)
////        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
////        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
////        username = try values.decodeIfPresent(String.self, forKey: .username)
////    }
//
//}
