//
//  Lesson2View.swift
//  HelloBaby
//
//  Created by Chou Coody on 2017/4/2.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

protocol Lesson2View_Protocol {
    func pressedButton(sender:Any)
}

class Lesson2View : UIView {
    
    var label: UILabel!
    var textField: UITextField!
    var button: UIButton!
    
    var delegate:Lesson2View_Protocol?
    
    convenience init(_ frame: CGRect ){
        self.init( frame: frame  )
    }
    
    override init(frame: CGRect) {
        super.init( frame:frame )
        self.initialUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Public
    func initialUI() -> Void {
    
        self.createLabel()
        self.createTextField()
        self.createButton()
        
        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(button)
        
        self.addAction()
    }
    
    func addAction() -> Void {
        self.button.addTarget(self,
                              action:#selector(self.pressedButton(sender:)),
                              for: UIControlEvents.touchUpInside)
    }
    
    // MARK: initial
    private func createLabel(){
        label = UILabel.init(frame: CGRect(x: 10, y: 40, width: 200, height: 45))
        label.layer.cornerRadius = 5.0
        label.backgroundColor = UIColor.gray
        label.text = "Hello World ?"
        label.textAlignment = .center
    }
    
    private func createTextField(){
        textField = UITextField.init(frame: CGRect(x:10 , y: 90, width: 200, height: 45))
        textField.layer.cornerRadius = 5.0
        textField.textAlignment = .center
        textField.textColor = UIColor.darkGray
        textField.backgroundColor = UIColor.gray
    }
    
    private func createButton(){
        button = UIButton.init(frame: CGRect(x: 10, y: 140, width: 200, height: 45))
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor.gray
        button.setTitle("確定", for: UIControlState.normal )
        button.setTitleColor(UIColor.blue, for: UIControlState.normal )
    }
    
    // MARK: Response
    func pressedButton( sender:Any ){
        delegate?.pressedButton( sender: sender )
    }
    
}
