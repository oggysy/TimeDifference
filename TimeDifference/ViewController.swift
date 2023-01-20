//
//  ViewController.swift
//  TimeDifference
//
//  Created by 小木曽佑介 on 2023/01/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var pressedButtonTimeLabel: UILabel!
    @IBOutlet weak var differentTimeLabel: UILabel!
    var currentTimeDate = Date()
    var pressedButtonTimeDate:Date? = nil
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    
    @objc func updateTimer(){
        currentTimeDate = Date()
        currentTimeLabel.text = dateFormatter.string(from: currentTimeDate)
        guard let pressedButtonTimeDate = pressedButtonTimeDate else {return}
        let differentTimeDate = Int(currentTimeDate.timeIntervalSince(pressedButtonTimeDate))
        differentTimeLabel.text = String(differentTimeDate)
    }
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        pressedButtonTimeDate = Date()
        guard let pressedButtonTimeDate = pressedButtonTimeDate else {return}
        pressedButtonTimeLabel.text = dateFormatter.string(from: pressedButtonTimeDate)
    }
}

