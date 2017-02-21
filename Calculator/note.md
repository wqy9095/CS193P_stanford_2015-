# 注释笔记



```swift
//

//  ViewController.swift

//  Calculator

//

//  Created by 汪 千雨 on 2017/2/16.

//  Copyright © 2017年 汪 千雨. All rights reserved.

//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    //var : 变量
    //! : 强制取值，此时UILabel一定有值，如果UILabel为nil则抛出runtime error
    
	//创建一个bool类型的变量
    var UserInTheMiddleOfTypingNumber : Bool = false
    
	
    @IBAction func appendDigit(_ sender: UIButton) {
		//let : 常量，不可改变的
        let digit = sender.currentTitle!

        if UserInTheMiddleOfTypingNumber {
			//可以对字符串使用+进行拼接
            display.text = display.text! + digit

        } else {

            display.text = digit

            UserInTheMiddleOfTypingNumber = true;

        }

    }

}
```

