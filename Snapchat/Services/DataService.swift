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
import FirebaseStorage

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
    
    var mainStorageRef: StorageReference {
        return Storage.storage().reference(forURL: "gs://snapchat-dev.appspot.com")
    }
    
    var imagesStorageRef: StorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: StorageReference {
        return mainStorageRef.child("videos")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child(CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
    
    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL:URL, textSnippet: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }
        let pr: Dictionary<String, AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject, "userID": senderUID as AnyObject, "openCount": 0 as AnyObject, "recipients": uids as AnyObject]
        
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
    }
}

















