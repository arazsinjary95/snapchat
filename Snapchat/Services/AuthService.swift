//
//  AuthService.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/11/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    
                    if error != nil {
                        //show error to user
                        self.handleFirebaseError(error: error! as NSError, onComplete: onComplete!)
                    } else {
                        //if we successfully create user or acount and now we have uid
                        if user?.user.uid != nil {
                            
                            DataService.instance.saveUser(uid: user!.user.uid)
                            //sign in
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                
                                if error != nil {
                                    //show error to user
                                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete!)
                                } else {
                                    //we have successfully logged in
                                    onComplete?(nil, user)
                                }
                            })
                        }
                    }
                })
            } else {
                //successfully logged in
                onComplete?(nil, user)
            }
        }
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion) {
        
        print(error.debugDescription)
        
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            
            switch (errorCode) {
            case .invalidEmail:
                onComplete("Invalid email address", nil)
                break
            case .wrongPassword:
                onComplete("Invalid password", nil)
                break
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete("Could not  create account. Email already in use", nil)
                break
            default:
                onComplete("There was a problem autheticating. Try again.", nil)
            }
        }
    }
    
    
}














