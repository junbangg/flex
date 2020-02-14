//
//  FirebaseReferenceManager.swift
//  flex
//
//  Created by Jun suk Bang on 2020/02/14.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation
import Firebase

struct FirebaseReferenceManager {
    static let environment = "dev"
    static let db = Firestore.firestore()
    static let root = db.collection(environment).document(environment)
    
    static func refrenceforUserPublicData(uid:String) -> DocumentReference {
        return root
            .collection(FirebaseKeys.CollectionPath.users)
            .document(uid)
            .collection(FirebaseKeys.CollectionPath.publicData)
            .document(FirebaseKeys.CollectionPath.publicData)
    }
}
