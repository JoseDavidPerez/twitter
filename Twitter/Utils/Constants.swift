//
//  Constants.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 20/11/23.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
