//
//  User.swift
//  ITable
//
//  Created by Admin on 08.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid  : String
    let email: String
  
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
  
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}

