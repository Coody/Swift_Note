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

class Lesson2View : UIView , UITableViewDelegate , UITableViewDataSource {
    
//    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempClassmate: Classmate = classroomAArray[indexPath.row]
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: K_CLASSMATE_TABLEVIEWCELL_IDENTIFY) as! ClassmateTableViewCell?
        if tableViewCell != nil {
            tableViewCell?.setClassmate(tempClassmate.name, tempClassmate.classroom, tempClassmate.birthday)
        }
        else{
            tableViewCell = ClassmateTableViewCell.init(classmateName: tempClassmate.name,
                                                        classmateClass: tempClassmate.classroom, 
                                                        classmateBirthday: tempClassmate.birthday)
        }
        return tableViewCell!
    }

    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classroomAArray.count
    }

    
    var button: UIButton!
    var classmateTableView: UITableView!
    var classroomAArray: Array<Classmate>! = [Classmate]()
    var classroomBArray: Array<Classmate>! = [Classmate]()
    
    var delegate:Lesson2View_Protocol?
    
    convenience init(_ frame: CGRect ){
        self.init( frame: frame  )
    }
    
    override init(frame: CGRect) {
        super.init( frame:frame )
        self.initialUI()
        self.initialClassrooms()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Public
    private func initialUI() -> Void {
    
        self.createUITableView()
        self.createButton()
        
        self.addSubview(classmateTableView)
        self.addSubview(button)
        
        self.addAction()
    }
    
    private func initialClassrooms(){
        for _ in 1...40{
            let classroomA_Classmate = Classmate.init()
            let classroomB_Classmate = Classmate.init()
            classroomAArray.append(classroomA_Classmate)
            classroomBArray.append(classroomB_Classmate)
        }
    }
    
    func addAction() -> Void {
        self.button.addTarget(self,
                              action:#selector(self.pressedButton(sender:)),
                              for: UIControlEvents.touchUpInside)
    }
    
    // MARK: initial    
    private func createButton(){
        button = UIButton.init(frame: CGRect(x: 0,
                                             y:classmateTableView.frame.origin.y + classmateTableView.frame.size.height ,
                                             width:self.frame.size.width,
                                             height:45))
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor.gray
        button.setTitle("確定", for: UIControlState.normal )
        button.setTitleColor(UIColor.blue, for: UIControlState.normal )
    }
    
    private func createUITableView(){
        classmateTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width:self.frame.size.width , height: self.frame.size.height - 45))
        classmateTableView.delegate = self
        classmateTableView.dataSource = self
    }
    
    // MARK: Response
    func pressedButton( sender:Any ){
        delegate?.pressedButton( sender: sender )
    }
    
}