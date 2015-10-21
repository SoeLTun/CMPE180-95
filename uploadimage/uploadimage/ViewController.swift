//
//  ViewController.swift
//  uploadimage
//
//  Created by Soe Tun on 10/7/15.
//  Copyright © 2015 lin. All rights reserved.
//
import UIKit
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
   @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
   @IBOutlet weak var myImageView: UIImageView!
    
       @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        myImageUploadRequest()
        myActivityIndicator.hidden = false;
    }
    
    @IBAction func selectPhotoButtonTapped(sender: AnyObject) {
        
        var myPickerController = UIImagePickerController();
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //myImageUploadRequest()
        
        myActivityIndicator.hidden = true;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func myImageUploadRequest()
    {
        
        let myUrl = NSURL(string: "http://www.swiftdeveloperblog.com/http-post-example-script/");
        //let myUrl = NSURL(string: "http://ezquote-server.herokuapp.com/userImageUpload?userUploadedImage=testing");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        let param = [
            
            "userId" : "1"
        ]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(myImageView.image!, 1)
        
        if(imageData==nil)  { return; }
        
        request.HTTPBody = createBodyWithParameters(param, filePathKey: "file", imageDataKey: imageData!, boundary: boundary)
        
        
        
        myActivityIndicator.startAnimating();
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("******* response = \(response)")
            
            // Print out reponse body
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("****** response data = \(responseString!)")
            
            var err: NSError?
            var json = (try!  NSJSONSerialization.JSONObjectWithData(data!, options: [])) as! NSDictionary
            
            
            
            dispatch_async(dispatch_get_main_queue(),{
                self.myActivityIndicator.stopAnimating()
                self.myImageView.image = nil;
            });
            
          
//            if let parseJSON = json {
//            var firstNameValue = parseJSON["firstName"] as? String
//            print("firstNameValue: \(firstNameValue)")
//            }
         
            
        }
        
        task.resume()
        
    }
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        var body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = "user-profile.jpg"
        
        let mimetype = "image/jpg"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        
        
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
    
    
    
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
    
    
}



extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}
