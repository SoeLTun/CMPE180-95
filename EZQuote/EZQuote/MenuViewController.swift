//
//  MenuViewController.swift
//  EZQuote
//
//  Created by Soe Tun on 8/1/15.
//  Copyright (c) 2015 CMPE180-95. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var l1: UILabel!
    var data:String!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            l1.text = data
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
