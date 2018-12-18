//
//  ViewController.swift
//  TableView
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 liuyuping. All rights reserved.
//

import UIKit

class ViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    var students=[Student]()
    var teachers=[Teacher]()
    var tableTitle=["Teacher","Student"]
    //定义一个表视图
    var table:UITableView!
    //右边按钮
    var rightItem:UIBarButtonItem!
   
    //弹出框
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //生成三个teacher 对象
        for i in 1...3{
        let temp = Teacher(title: "tt", firstName: "xiao", lastName: "fang\(i)", age: 41, gender: .female, department: .one)
        teachers.append(temp)
        }
        //生成4个student对象
        for i in 1..<5{
            let temp = Student(stuNo: 2016110301+i, firstName: "xiao", lastName: "hong\(i)", age: 20, gender: .male, department: .two)
            students.append(temp)
        }
        //按全名排序
        teachers.sort{
            return $0.fullName < $1.fullName
        }
        students.sort{
            return $0.fullName < $1.fullName
        }
        
        //创建表视图，并设置代理和数据
        table = UITableView(frame: self.view.bounds)
        table .delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        
        //导航栏控制器右边的按钮
        rightItem=UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = rightItem
        
        //导航栏控制器左边的按钮
        let _ = UIBarButtonItem(title: "添加", style: .plain, target: self , action: #selector(addStudent))
    }
    //编辑表视图
    @objc func edit(){
        if table.isEditing{
            rightItem.title="编辑"
            table.isEditing=false
        }else{
            rightItem.title="完成"
            table.isEditing=true
        }
    }
    @objc func addStudent(){
        alert = UIAlertController(title: "lucky", message: "cat", preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "学号"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "姓"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "名"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "性别"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "年龄"
        }
        let OKBtn = UIAlertAction(title: "确定", style: .default) {
            (alert) in
            self.add()
        }
        let  cancleBtn=UIAlertAction(title: "取消", style: .cancel, handler:nil )
         alert.addAction(OKBtn)
         alert.addAction(cancleBtn)
        self.present(alert,animated:true,completion:nil )
    }
  //添加学生
    func add(){
        let no = Int(alert.textFields![0].text!)
        let firstName = alert.textFields![1].text!
        let lastName = alert.textFields![2].text!
        let gender:Gender
        switch alert.textFields![3].text!{
        case "男":
            gender = .male
        case "女":
            gender = .female
        default:
            gender = .unknow
        }
        let age = Int(alert.textFields![4].text!)
        let student = Student(stuNo:no!,firstName:firstName,lastName:lastName,age:age!,gender:gender)
        students.append(student)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teachers.count
        }else{
            return students.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = tableTitle[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            let _: UITableViewCell.CellStyle = (identifier == "Teacher") ? .subtitle : .default
            cell?.accessoryType = .disclosureIndicator
        }
        
        switch identifier{
        case "Teacher":
            cell?.textLabel?.text = teachers[indexPath.row].fullName
            cell?.detailTextLabel?.text = teachers[indexPath.row].title
        case "Student":
             cell?.textLabel?.text = students[indexPath.row].fullName
        default:
            break
        }
        return cell!
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

