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
