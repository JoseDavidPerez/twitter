//
//  Tweet.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 23/11/23.
//

import Foundation

struct Tweet {
    let caption : String
    let tweetID : String
    let uid : String
    let likes : Int
    var timestamp : Date!
    let retweetCount: Int
    
    
    init(tweetID: String, dictionary: [String: Any]) {
        
        self.tweetID = tweetID
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }

    }
}
