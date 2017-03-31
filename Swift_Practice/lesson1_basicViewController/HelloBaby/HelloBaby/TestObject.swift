//
//  TestObject.swift
//  HelloBaby
//
//  Created by Coody on 2017/3/30.
//  Copyright © 2017年 Coody. All rights reserved.
//

import Foundation

class TestObject: NSObject , ObjectiveProtocol {
    
    internal var name: String
    
    var test : String
    
    override init(){
        test = "123"
        self.name = "John"
        super.init()
    }
    
    func run() {
        print("self.name:\(self.name) runing!!\n \(self.test)")
    }
    
}
