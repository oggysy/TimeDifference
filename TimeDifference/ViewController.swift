//
//  ViewController.swift
//  TimeDifference
//
//  Created by 小木曽佑介 on 2023/01/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var pressedButtonTime: UILabel!
    @IBOutlet weak var differentTime: UILabel!
    var currentTimeData = Date()
    var pressedButtonTimeData:Date? = nil
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    
    @objc func updateTimer(){
        currentTimeData = Date()
        currentTime.text = dateFormatter.string(from: currentTimeData)
        guard let pressedButtonTimeData = pressedButtonTimeData else {return}
        let differentTimeData = Int(currentTimeData.timeIntervalSince(pressedButtonTimeData))
        differentTime.text = String(differentTimeData)
    }
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        pressedButtonTimeData = Date()
        pressedButtonTime.text = dateFormatter.string(from: pressedButtonTimeData!)
    }
}

