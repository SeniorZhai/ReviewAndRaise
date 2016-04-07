//
//  ViewController.swift
//  StopWatch
//
//  Created by zhai on 16/4/7.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(Counter)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    @IBAction func play(sender: AnyObject) {
        if(IsPlaying){
            return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"),userInfo: nil, repeats: true)
        IsPlaying = true
    }
    @IBAction func pause(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
    }
    
    @IBAction func reset(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        label.text = String(Counter)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateTimer() {
        Counter += 0.1
        label.text = String(format: "%.1f", Counter)
    }
}

