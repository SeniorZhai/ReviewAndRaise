//
//  RegisterViewController.swift
//  Controller
//
//  Created by zhai on 16/4/24.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cencel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {()->Void in
            print("关闭模态视图")
        })
    }

    @IBAction func save(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
            print("保存")
            let userInfo = NSDictionary(object: self.username.text!,forKey:"username")
            NSNotificationCenter.defaultCenter().postNotificationName("RegisterNotification", object: nil, userInfo: userInfo as [NSObject : AnyObject])
        }
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
