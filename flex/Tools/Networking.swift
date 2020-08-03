//
//  Networking.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/02.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation

struct Config {
    static let baseURL = "http://localhost:3000/api/users/"
}

enum HTTPMethod<Body> {
    case get
    case post(Body)
    case patch(Body)
    case delete(Body)
    case put(Body)
}

extension HTTPMethod {
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        case .put:
            return "PUT"
        }
    }
}

