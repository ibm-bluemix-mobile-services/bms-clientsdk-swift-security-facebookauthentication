//
//  ViewController.swift
//  FacebookMCA
//
//  Created by Ilan Klein on 07/03/2016.
//  Copyright © 2016 ibm. All rights reserved.
//

import UIKit
import BMSCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var answerTextView: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectWithFacebook(_ sender: AnyObject) {
        
        let callBack:BMSCompletionHandler = {(response: Response?, error: Error?) in
            var ans:String = "";
            if error == nil {
                ans="response:\(response?.responseText), no error"
            } else {
                ans="ERROR , error=\(error)"
            }
            DispatchQueue.main.async(execute: {
                self.answerTextView.text = ans
            })
            
        }
        let request = Request(url: AppDelegate.resourceURL, method: HttpMethod.GET)
        request.send(completionHandler: callBack)
    }
}

