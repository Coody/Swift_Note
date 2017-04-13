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
    
    var classmateNameLabel: UILabel?
    var classmateClassLabel:UILabel?
    var classmateBirthdayLabel: UILabel?
    
    convenience init( classmateName:String! , classmateClass:String! , classmateBirthday:String! ){
        self.init( style:UITableViewCellStyle.default , reuseIdentifier:K_CLASSMATE_TABLEVIEWCELL_IDENTIFY )
        self.frame = UIScreen.main.bounds
        self.setClassmate(classmateName, classmateClass, classmateBirthday)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setClassmate(_ classmateName:String? ,_ classmateClass:String? ,_ classmateBirthday:String? ){
        self.initialClassmateName(classmateName)
        self.initialClassmateClass(classmateClass)
        self.initialClassmateBirthday(classmateBirthday)
    }
    
    private func initialClassmateName(_ classmateName:String? ){
        if classmateNameLabel == nil {
            classmateNameLabel = UILabel.init(frame: CGRect(x: 12, y: 0, width: 120, height: 45))
            classmateNameLabel!.textColor = .black
            classmateNameLabel!.textAlignment = .center
            self.addSubview(classmateNameLabel!)
        }
        if let name = classmateName{
            self.classmateNameLabel!.text = name
        }
        else{
            self.classmateNameLabel!.text = "（無名氏）"
        }
    }
    
    private func initialClassmateClass(_ classmateClass:String? ){
        if classmateClassLabel == nil{
            classmateClassLabel = UILabel.init(frame: CGRect(x: classmateNameLabel!.frame.origin.x + classmateNameLabel!.frame.size.width + 12,
                                                             y: 0, width: 50, height: 45))
            classmateClassLabel!.textColor = .black
            classmateClassLabel!.textAlignment = .center
            self.addSubview(classmateClassLabel!)
        }
        if classmateClass != nil {
            self.classmateClassLabel!.text = classmateClass
        }
        else{
            self.classmateClassLabel!.text = "（無班級）"
        }
    }
    
    private func initialClassmateBirthday(_ classmateBirthday:String? ){
        if classmateBirthdayLabel == nil {
            classmateBirthdayLabel = UILabel.init(frame: CGRect(x: classmateClassLabel!.frame.origin.x + classmateClassLabel!.frame.size.width + 12,
                                                                y: 0, width: 120, height: 45))
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
