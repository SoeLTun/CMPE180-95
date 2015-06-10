//
//  ViewController.swift
//  windowsEstimator
//
//  Created by Soe Tun on 6/9/15.
//  Copyright (c) 2015 CMPE180-95. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
       @IBAction func getUserName(sender: UITextField) {
        
        
        let user = sender.text
        println("Username is ",user)
    }
    
    
    @IBAction func showusername(sender: UIButton) {
        let user = username.text
        println(user)
        usernameLabel.text = user
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

