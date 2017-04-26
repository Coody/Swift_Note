//
//  Lesson2ViewController.swift
//  HelloBaby
//
//  Created by Chou Coody on 2017/4/2.
//  Copyright © 2017年 Coody. All rights reserved.
//

import UIKit

enum ClassroomViewMode {
    case Total
    case GetTheSameBirthday
}

class Lesson2ViewController : UIViewController{
    
    // MARK: init
    var mainView:Lesson2View!
    
    var classroomViewMode = ClassroomViewMode.Total
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = Lesson2View.init(frame: self.view.frame)
        mainView.delegate = self;
        self.view.addSubview(mainView)
        self.view.backgroundColor = UIColor.lightGray
        
        self.initialClassrooms()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension Lesson2ViewController{
    func initialClassrooms(){
        for _ in 1...40{
            let classroomA_Classmate = Classmate.init( nil,nil,Date.getBirthdayString(nil))
            let classroomB_Classmate = Classmate.init( nil,nil,Date.getBirthdayString(nil))
            mainView.classroomAArray.append(classroomA_Classmate)
            mainView.classroomBArray.append(classroomB_Classmate)
        }
    }
}


extension Lesson2ViewController : Lesson2View_Protocol{
    
    func pressedButton(sender: Any) {
        
        switch classroomViewMode {
        case .Total:
            classroomViewMode = .GetTheSameBirthday
            let birthdaySetA = Set(mainView.classroomAArray.flatMap{ $0 as? Classmate})
            let birthdaySetB = Set(mainView.classroomBArray as! [Classmate])
            let theSameBirthdaySet = birthdaySetA.intersection(birthdaySetB)
        case .GetTheSameBirthday:
            classroomViewMode = .Total
        default:
            
        }
        
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
