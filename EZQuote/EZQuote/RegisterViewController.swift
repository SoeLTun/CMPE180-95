//
//  RegisterViewController.swift
//  EZQuote
//
//  Created by Soe Tun on 8/1/15.
//  Copyright (c) 2015 CMPE180-95. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerConfirmPassword: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    @IBOutlet weak var registerEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerSignUpBtn(sender: AnyObject) {
        // check all three fields
    if registerEmail.text == "" && registerPassword.text == "" && registerConfirmPassword.text == ""
    {
        print("all three are missing")
        let alertbox = UIAlertController(title: "Alert!", message: "Input fields are empty", preferredStyle: UIAlertControllerStyle.Alert)
        let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in
        }
        alertbox.addAction(dismissBtn)
        self.presentViewController(alertbox, animated: true, completion: nil)
    }
        // check email
        else if registerEmail.text == ""
    {
        print("Email is misssing")
        let alertbox = UIAlertController(title: "Alert!", message: "Email is missing", preferredStyle: UIAlertControllerStyle.Alert)
        let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in
        }
        alertbox.addAction(dismissBtn)
        self.presentViewController(alertbox, animated: true, completion: nil)
    }
        
        // check password
        else if  registerPassword.text == ""
    {
        print("Password is missing")
        let alertbox = UIAlertController(title: "Alert!", message: "Password is missing", preferredStyle: UIAlertControllerStyle.Alert)
        let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in
        }
        alertbox.addAction(dismissBtn)
        self.presentViewController(alertbox, animated: true, completion: nil)
        }
        
        // check confirm password
        else if registerConfirmPassword == ""
    {
        
        print("Confirm is missing")
        let alertbox = UIAlertController(title: "Alert!", message: "Confirm password is missing", preferredStyle: UIAlertControllerStyle.Alert)
        let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in
        }
        alertbox.addAction(dismissBtn)
        self.presentViewController(alertbox, animated: true, completion: nil)
        }
        
        
        else{
        
            let email = registerEmail.text
            let password = registerPassword.text
            let confirmpassword = registerConfirmPassword.text
        
        
        
        
        
            // show error message
            if !isValidateEmail(email!)
            {
                
                print("Invalid")
                let alertbox = UIAlertController(title: "Warning!", message: "Email address is not valid", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in}
                
                alertbox.addAction(dismissBtn)
                self.presentViewController(alertbox, animated: true, completion: nil)

            }
        
            // check both passwords are equal or not
            else if password != confirmpassword
            {
                print("Password and confirm password are not equal")
                let alertbox = UIAlertController(title: "Warning!", message: "Password and confirm password do not match", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in}
                
                alertbox.addAction(dismissBtn)
                self.presentViewController(alertbox, animated: true, completion: nil)
            }
            
            //  register begin
            else
            {
                print("Registering")
                let alertbox = UIAlertController(title: "Confirm!", message: "Successfully Register", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissBtn = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){(libSelected) -> Void in}
                
                alertbox.addAction(dismissBtn)
                self.presentViewController(alertbox, animated: true, completion: nil)

            }
        
        }
    }
    
    
    // Check valid email or not
    func isValidateEmail(email:String) -> Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
        
        
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
