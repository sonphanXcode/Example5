//
//  EndPoint.swift
//  iOS
//
//  Created by sp7 on 23/6/26.
//

import Foundation

enum WelcomeEndPoint: String {
    case callPosts_1 = "posts/1"
    case callPosts = "posts"
//    case creatingAResource = "posts"
}

struct Resources: Codable {
    var userId: String?
    var id: Int?
    var title: String?
    var body: String?
    
    init(userId: String? = nil, id: Int? = nil, title: String? = nil, body: String? = nil) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
