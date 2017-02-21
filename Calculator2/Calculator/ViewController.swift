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
    
    var UserInTheMiddleOfTypingNumber = false
    // var UserInTheMiddleOfTypingNumber : Bool = false
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if UserInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            UserInTheMiddleOfTypingNumber = true
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if UserInTheMiddleOfTypingNumber{
            enter();
        }
        switch operation {
            //利用swift的自动推断特性可以将乘法的实现缩小至如下
            /*
             case "×":performOperation({ (op1: Double ,op2: Double) -> Double in
             return op1 * op2
             })
             */
        case "×":performOperation{$0 * $1}
        case "÷":performOperation{$1 / $0}
        case "+":performOperation{$0 + $1}
        case "−":performOperation{$1 - $0}
        case "√":performOperation{sqrt($0)}
        default:
            break
        }
    }
    
    //课上教授使用的老版本的Xcode，两个函数可以重名，但是新版本中不支持，原因在于该swift文件中的ViewController类继承的是OC里的UIViewController，而OC是不支持方法重载的
    //因此在这里有两个方法可以解决函数重名问题：1.让两个函数不重名；2.在其中一个方法前添加private修饰
    private func performOperation(operation: (Double , Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        UserInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue : Double {
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            UserInTheMiddleOfTypingNumber = false
        }
    }
}

