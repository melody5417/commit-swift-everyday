//
//  ViewController.swift
//  StopWatch
//
//  Created by Yiqi Wang on 16/2/19.
//  Copyright © 2016年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var counter = 0.0
  var timer = NSTimer()
  var isPlaying = false
  
  @IBOutlet weak var timeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    timeLabel.text = String(counter)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func resetAction(sender: AnyObject) {
    timer.invalidate()
    isPlaying = false
    counter = 0.0
    timeLabel.text = String(counter)
  }
  
  @IBAction func pauseAction(sender: AnyObject) {
    timer.invalidate()
    isPlaying = false
  }

  @IBAction func playAction(sender: AnyObject) {
    if (isPlaying) {
      return
    }
    
    timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    isPlaying = true
  }
  
  func updateTimer() {
    counter = counter + 0.1
    timeLabel.text = String(format: "%.1f",counter)
  }
}

