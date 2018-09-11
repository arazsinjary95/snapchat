//
//  AuthService.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/11/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    
                    if error != nil {
                        //show error to user
                    } else {
                        //if we successfully create user or acount and now we have uid
                        if user?.user.uid != nil {
                            //sign in
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                
                                if error != nil {
                                    //show error to user
                                } else {
                                    //we have successfully logged in
                                }
                            })
                        }
                    }
                })
            } else {
                //successfully logged in
            }
        }
    }
}
