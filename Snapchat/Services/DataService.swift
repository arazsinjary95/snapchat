//
//  DataService.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/12/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

let CHILD_USERS = "users"

import Foundation
import FirebaseDatabase

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child(CHILD_USERS)
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
        mainRef.child(CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
}
