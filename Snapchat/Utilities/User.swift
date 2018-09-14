//
//  User.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/13/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

struct User {
    
    private var _firstName: String
    private var _uid: String
    
    var firstName: String {
        return _firstName
    }
    
    var uid: String {
        return _uid
    }
    
    init(firstName: String, uid: String) {
        self._firstName = firstName
        self._uid = uid
    }
}
