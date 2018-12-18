//
//  ViewController.swift
//  9-1(gesture)
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 liuyuping. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func tap(recognizer:UITapGestureRecognizer){
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
        }
    }
    
    @IBAction func AddLabel(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "A"
        label.backgroundColor = UIColor.purple
        label.textAlignment = .center
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowOpacity = 1
        
        self.view.addSubview(label)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        
        label.isUserInteractionEnabled = true
    }
    
    @objc func pan(recognizer:UIPanGestureRecognizer){
        
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    
    @IBAction func MoveLabel(_ sender: Any) {
        for  label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
//                    label.center = CGPoint(x: x, y: y)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
            }
        }
    }
    
    @IBAction func DeleteLabel(_ sender: Any) {
        for  label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
}

