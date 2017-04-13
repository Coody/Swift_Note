//
//  ClassmateTableViewCell.swift
//  HelloBaby
//
//  Created by Coody on 2017/4/12.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

let K_CLASSMATE_TABLEVIEWCELL_IDENTIFY = "K_CLASSMATE_TABLEVIEWCELL_IDENTIFY"

class ClassmateTableViewCell: UITableViewCell {
    
    var classmateSeatNumberLabel: UILabel?
    var classmateNameLabel: UILabel?
    var classmateClassLabel:UILabel?
    var classmateBirthdayLabel: UILabel?
    
    // MARK: 初始化
    convenience init(classmateSeatNumber:Int! , classmateName:String! , classmateClass:String! , classmateBirthday:String! ){
        self.init( style:UITableViewCellStyle.default , reuseIdentifier:K_CLASSMATE_TABLEVIEWCELL_IDENTIFY )
        self.frame = UIScreen.main.bounds
        self.setClassmate(classmateSeatNumber, classmateName, classmateClass, classmateBirthday)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setClassmate(_ classmateSeatNumber:Int! , _ classmateName:String? ,_ classmateClass:String? ,_ classmateBirthday:String? ){
        self.initialClassmateSeatNumber(classmateSeatNumber)
        self.initialClassmateName(classmateName)
        self.initialClassmateClass(classmateClass)
        self.initialClassmateBirthday(classmateBirthday)
    }
}

/**
 *
 * 關於在 Objective-C 的 Category 可以使用命名讓 Category 功能區別，
 * 在 swift 的 Extension 的命名呢？可以參考這篇文章：
 * http://stackoverflow.com/questions/26319660/whats-the-best-practice-for-naming-swift-files-that-add-extensions-to-existing
 *
 */
private extension ClassmateTableViewCell{
    // MARK: private
    func initialClassmateSeatNumber(_ classmateSeatNumber:Int! ){
        if classmateSeatNumberLabel == nil {
            classmateSeatNumberLabel = UILabel.init(frame: CGRect(x: 12, y: 0, width:self.frame.size.width*0.1, height: 45))
            classmateSeatNumberLabel!.font = UIFont.systemFont(ofSize: 12.0)
            classmateSeatNumberLabel!.textColor = .black
            classmateSeatNumberLabel!.textAlignment = .left
            self.addSubview(classmateSeatNumberLabel!)
        }
        self.classmateSeatNumberLabel!.text = String(classmateSeatNumber)
    }
    
    func initialClassmateName(_ classmateName:String? ){
        if classmateNameLabel == nil {
            classmateNameLabel = UILabel.init(frame: CGRect(x: 40, y: 0, width:self.frame.size.width*0.2, height: 45))
            classmateNameLabel!.font = UIFont.systemFont(ofSize: 12.0)
            classmateNameLabel!.textColor = .black
            classmateNameLabel!.textAlignment = .center
            self.addSubview(classmateNameLabel!)
        }
        if let name = classmateName{
            self.classmateNameLabel!.text = name
        }
        else{
            self.classmateNameLabel!.text = "??"
        }
    }
    
    func initialClassmateClass(_ classmateClass:String? ){
        if classmateClassLabel == nil{
            classmateClassLabel = UILabel.init(frame: CGRect(x: classmateNameLabel!.frame.origin.x + classmateNameLabel!.frame.size.width + 12,
                                                             y: 0, width:self.frame.size.width*0.2, height: 45))
            classmateClassLabel!.font = UIFont.systemFont(ofSize: 12.0)
            classmateClassLabel!.textColor = .black
            classmateClassLabel!.textAlignment = .center
            self.addSubview(classmateClassLabel!)
        }
        if classmateClass != nil {
            self.classmateClassLabel!.text = classmateClass
        }
        else{
            self.classmateClassLabel!.text = "?"
        }
    }
    
    func initialClassmateBirthday(_ classmateBirthday:String? ){
        if classmateBirthdayLabel == nil {
            classmateBirthdayLabel = UILabel.init(frame: CGRect(x: classmateClassLabel!.frame.origin.x + classmateClassLabel!.frame.size.width + 12,
                                                                y: 0, width:self.frame.size.width*0.3, height: 45))
            classmateBirthdayLabel!.font = UIFont.systemFont(ofSize: 12.0)
            classmateBirthdayLabel!.textColor = .black
            classmateBirthdayLabel!.textAlignment = .right
            self.addSubview(classmateBirthdayLabel!)
        }
        if classmateBirthday != nil {
            self.classmateBirthdayLabel!.text = classmateBirthday
        }
        else{
            self.classmateBirthdayLabel!.text = "2000/01/01"
        }
    }

}
