//
//  ViewController.swift
//  Controller
//
//  Created by zhai on 16/4/24.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(registerCompletion), name: "RegisterNotification", object: nil)
    }

    func registerCompletion(noticatin:NSNotification)  {
        let data = noticatin.userInfo! as NSDictionary
        print("\(data.objectForKey("username"))")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

