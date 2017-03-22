//
//  ViewController.swift
//  HelloBaby
//
//  Created by Coody on 2017/3/20.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var label: UILabel!
    weak var textfield: UITextField!
    weak var button: UIButton!
    func pressedButton(_ sender: Any){
        label.text = textfield.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        label.frame.origin.x = 20
        label.frame.origin.y = 20
        
        textfield.frame.origin.x = 20
        textfield.frame.origin.y = 60
        
        button.frame.origin.x = 20
        button.frame.origin.y = 100
        
        self.view.addSubview(label)
        self.view.addSubview(textfield)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

