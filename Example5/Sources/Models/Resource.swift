//
//  Resource.swift
//  iOS
//
//  Created by sp7 on 24/6/26.
//

import Foundation

//struct Resource {
//    var title: String
//    var body: String
//    var userId: String
//    var id: Int
//}

struct RequestObjectCreateItem: Codable {
    var title: String
    var body: String
    var userId: String
    
    init(title: String, body: String, userId: String) {
        self.title = title
        self.body = body
        self.userId = userId
    }
}
