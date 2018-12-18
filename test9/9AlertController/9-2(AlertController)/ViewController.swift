//
//  ViewController.swift
//  9-2(AlertController)
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 liuyuping All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "please choose color", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "RED", style: .default, handler: {(action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "BLUE", style: .destructive, handler: {(action) in
            self.view.backgroundColor = UIColor.blue
        }))
        alert.addAction(UIAlertAction(title: "YELLOW", style: .cancel, handler: {(action) in
            self.view.backgroundColor = UIColor.yellow
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginAlert(_ sender: Any) {
        let alert = UIAlertController(title: "login alert", message: "please input your information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            if let username = alert.textFields?.first, let password = alert.textFields?.last {
                print("uername:\(username.text!) password:\(password.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (action) in
        }))
        alert.addTextField{(UITextField) in
            UITextField.placeholder = "your username?"
        }
        alert.addTextField{(UITextField) in
            UITextField.placeholder = "your password?"
        }
        present(alert, animated: true, completion: nil)
    }
}

