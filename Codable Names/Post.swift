//
//  Post.swift
//  Codable Names
//
//  Created by Ansuke on 3/2/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

struct Post: Codable {
    let notTitle: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case notTitle = "title"
        case body
    }
}
