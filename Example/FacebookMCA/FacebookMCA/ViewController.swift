//
//  ViewController.swift
//  FacebookMCA
//
//  Created by Asaf Manassen on 09/02/2016.
//  Copyright © 2016 Asaf Manassen. All rights reserved.
//


/***
IMPORTANT: Don't forget that for the app to work you must fill your facebook id in the plist
***/
import UIKit
import BMSSecurity
class ViewController: UIViewController {

    
    @IBOutlet weak var answerTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func connectWithFacebook(sender: AnyObject) {
        
        

        
        let callBack:MfpCompletionHandler = {(response: Response?, error: NSError?) in
            var ans:String = "";
            if error == nil {
               ans="response:\(response?.responseText), no error"
            } else {
                ans="ERROR , error=\(error)"
            }
            print (ans)
            dispatch_async(dispatch_get_main_queue(), {
                self.answerTextView.text = ans
            })

        }

        print("URL =  \(AppDelegate.customResourceURL)")
        let request = Request(url: AppDelegate.customResourceURL, method: HttpMethod.GET)
        
        request.sendWithCompletionHandler(callBack)
        
    }
}

