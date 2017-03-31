//
//  ViewController.swift
//  HelloBaby
//
//  Created by Coody on 2017/3/20.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    weak var label: UILabel!
//    weak var textfield: UITextField!
//    weak var button: UIButton!
//    func pressedButton(_ sender: Any){
//        label.text = textfield.text
//    }
    
    var button: UIButton!
    var label: UILabel!
    
    convenience init() {
        self.init(imageURL: nil)
    }
    
    init(imageURL: NSURL?) {
        super.init(nibName: nil, bundle: nil)
        button = UIButton.init(type: UIButtonType.roundedRect)
        button.layer.borderColor = UIColor( red: 0.7, green: 0.7, blue:0.7, alpha: 1.0 ).cgColor
        button.layer.borderWidth = 3.0
        button.layer.cornerRadius = 10.0
        button.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        button.setTitle("Test", for: UIControlState.normal)
        self.view.addSubview(button)
        self.view.backgroundColor = .gray
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

