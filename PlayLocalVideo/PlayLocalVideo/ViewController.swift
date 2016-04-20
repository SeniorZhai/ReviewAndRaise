//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by zhai on 16/4/14.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var data = [
         "videoScreenshot01",
         "videoScreenshot02",
         "videoScreenshot03",
         "videoScreenshot04",
         "videoScreenshot05",
         "videoScreenshot06"]
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count * 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyTableViewCell
        cell.background.image = UIImage(named: data[indexPath.row%data.count])
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        playerView = AVPlayer(URL:NSURL(fileURLWithPath: path!))
        playViewController.player = playerView
        
        self.presentViewController(playViewController,animated:true){
            self.playViewController.player?.play()
        }
    }
}

