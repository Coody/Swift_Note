//
//  Classmate.swift
//  HelloBaby
//
//  Created by Coody on 2017/4/13.
//  Copyright © 2017年 Coody. All rights reserved.
//

import Foundation

class Classmate: NSObject {
    var name: String?
    var classroom: String?
    var birthday: String?
    
    override init(){
        super.init()
        self.name = nil
        self.classroom = nil
        self.birthday = nil
    }
    
    convenience init(_ name:String? = nil , _ classroom:String? = nil , _ birthday:String? = nil ) {
        self.init()
        self.name = name
        self.classroom = classroom
        self.birthday = birthday
    }
    
}
