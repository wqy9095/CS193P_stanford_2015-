//
//  ViewController.swift
//  Calculator
//
//  Created by 汪 千雨 on 2017/2/16.
//  Copyright © 2017年 汪 千雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!//var 实例变量
    
    var UserInTheMiddleOfTypingNumber : Bool = false
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if UserInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            UserInTheMiddleOfTypingNumber = true;
        }
    }
}

