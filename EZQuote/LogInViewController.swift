//
//  LogInViewController.swift
//  EZQuote
//
//  Created by Soe Tun on 8/1/15.
//  Copyright (c) 2015 CMPE180-95. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

   
    
    @IBOutlet weak var loginEmail: UITextField!
    
    
    @IBOutlet weak var loginPassword: UITextField!
    
    
    /*This function checks there are missing inputs and
        validates a  user's email and password
    */
    
    @IBAction func LoginBtn() {
        //check both email and password
        if loginEmail.text == "" && loginPassword.text == ""
        {
            print("Both Missing")
            let alertBox = UIAlertController(title: "Alert!", message: "Email and password is missing", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ (libSelected) -> Void in }
            alertBox.addAction(dismissButton)
            self.presentViewController(alertBox, animated: true, completion: nil)
            
        }
            
        // check for email
        else if loginEmail.text == ""
        {
            print("Email Missing")
            let alertBox = UIAlertController(title: "Alert!", message: "Email  is missing", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ (libSelected) -> Void in }
            alertBox.addAction(dismissButton)
            self.presentViewController(alertBox, animated: true, completion: nil)
            
        }
            
        // check for password
        else if loginPassword.text == ""
        {
            print("Passeword Missing")
            let alertBox = UIAlertController(title: "Alert!", message: "Password  is missing", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ (libSelected) -> Void in }
            alertBox.addAction(dismissButton)
            self.presentViewController(alertBox, animated: true, completion: nil)
            
        }
        
        // validate email and password
        else if loginEmail.text == "a" && loginPassword.text == "a"
        {
            print("Valid")

            let menuVC2 = self.storyboard!.instantiateViewControllerWithIdentifier("Menu") as!MenuViewController
            menuVC2.data = loginEmail.text
            self.navigationController?.pushViewController(menuVC2, animated: true)
        }
        else
        {
            print("Email or Passeword is not correct")
            let alertBox = UIAlertController(title: "Alert!", message: "Email or Password is not Valid", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ (libSelected) -> Void in }
            alertBox.addAction(dismissButton)
            self.presentViewController(alertBox, animated: true, completion: nil)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        var menu = segue.destinationViewController as! MenuViewController
    }
    */

}
