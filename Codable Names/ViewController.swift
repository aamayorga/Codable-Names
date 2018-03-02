//
//  ViewController.swift
//  Codable Names
//
//  Created by Ansuke on 3/2/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onGetTap(_ sender: UIButton) {
        NetworkingService.shared.getPosts()
    }
    
    @IBAction func onPostTap(_ sender: UIButton) {
        let newPost = Post(notTitle: "Hello", body: "Goodbye")
        NetworkingService.shared.send(newPost)
    }
}

