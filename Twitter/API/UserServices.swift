//
//  UserServices.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 22/11/23.
//

import Foundation
import FirebaseAuth

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else  { return }
            print("Ajolote\(dictionary)")
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
            print("DEBUG: Username is:\(user.username)")
            print("DEBUG: Username is:\(user.fullname)")
        }
    }
}
