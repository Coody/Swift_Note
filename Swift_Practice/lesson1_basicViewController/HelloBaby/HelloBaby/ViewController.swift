//
//  ViewController.swift
//  HelloBaby
//
//  Created by Coody on 2017/3/20.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    var textfield: UITextField!
    var button: UIButton!
//    func pressedButton(_ sender: Any){
//        label.text = textfield.text
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black;
        
        label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 40))
        label.layer.cornerRadius = 5.0
        label.backgroundColor = UIColor.gray
        label.text = "Hello World ?"
        label.textAlignment = .center
        
        textfield = UITextField(frame: CGRect(x: 20, y: 80, width: 200, height: 40))
        textfield.layer.cornerRadius = 5.0
        textfield.textAlignment = .center
        textfield.textColor = UIColor.darkGray
        textfield.backgroundColor = UIColor.gray
        
        // http://stackoverflow.com/questions/24102191/make-a-uibutton-programatically-in-swift
        button = UIButton(frame: CGRect(x: 20, y: 140, width: 200, height: 40))
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor.gray
        button.setTitle("確定", for: UIControlState.normal )
        button.setTitleColor(UIColor.blue, for: UIControlState.normal )
        button.addTarget(self,
                         action:#selector(self.pressed) ,
                         for:.touchUpInside)
        
        self.view.addSubview(label)
        self.view.addSubview(textfield)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:
    func pressed(sender: UIButton!){
        label.text = textfield.text
    }
    
}

