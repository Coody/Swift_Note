//
//  Lesson2ViewController.swift
//  HelloBaby
//
//  Created by Chou Coody on 2017/4/2.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

class Lesson2ViewController : UIViewController{
    
    // MARK: init
    var mainView:Lesson2View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = Lesson2View.init(frame: self.view.frame)
        mainView.delegate = self;
        self.view.addSubview(mainView)
        
        self.view.backgroundColor = UIColor.lightGray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension Lesson2ViewController : Lesson2View_Protocol{
    
    func pressedButton(sender: Any) {
        
    }
    
}


extension Date{
    static func getBirthdayString(_ dateBetween365: Int?) -> String {
        let month = [31,28,31,30,31,30,31,31,30,31,30,31]
        
        func dateString(_ dateInt: Int ) -> String {
            var total = 0
            for (index , element) in month.enumerated() {
                total = total + element
                if total > dateInt {
                    return ("\(index + 1) 月 \(dateInt - (total - element))日")
                }
            }
            return ""
        }
        
        if let checkDate = dateBetween365 {
            return dateString(checkDate)
        }
        else{
            return dateString((Int)(arc4random()%365) + 1)
        }
    }
}
