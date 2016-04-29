//
//  ViewController.swift
//  Tuts8Ball
//
//  Created by Derek Jensen on 3/31/16.
//  Copyright © 2016 Kreative Dimensions, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let results: [String] = ["JavaScript", "Swift", "Python", "Objective-C", "C#", "R", "PHP", "Java", "C++", "Ruby", "SQL", "Ask Later"]

    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped))
        tapRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.Select.rawValue)]
        
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tapped(gestureRecognizer: UITapGestureRecognizer) {
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 0.0
        fadeAnimation.toValue = 1.0
        fadeAnimation.duration = 1.0
        
        let random = Int(arc4random_uniform(UInt32(results.count)))
        let choice = results[random]
        lblResult.text = choice
        
        lblResult.layer.addAnimation(fadeAnimation, forKey: "opacity")
    }
}

