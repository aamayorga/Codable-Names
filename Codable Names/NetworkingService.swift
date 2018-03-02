//
//  NetworkingService.swift
//  Codable Names
//
//  Created by Ansuke on 3/2/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

class NetworkingService {
    private init() {}
    static let shared = NetworkingService()
    
    func getPosts() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                
                for post in posts {
                    debugPrint()
                    print(post.notTitle)
                }
            } catch {}
        }
        task.resume()
    }
    
    func send(_ post: Post) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encodedPost = try JSONEncoder().encode(post)
            request.httpBody = encodedPost
        } catch {}
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, res, err) in
            guard let data  = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {}
        }
        task.resume() 	
    }
}


