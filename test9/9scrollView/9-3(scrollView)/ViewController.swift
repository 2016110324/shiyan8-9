//
//  ViewController.swift
//  9-3(scrollView)
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 liuyuping. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        
        scrollView.contentSize = CGSize(width: 7 * scrollView.bounds.width , height: scrollView.bounds.height)
        
        scrollView.delegate = self
        
        pageControll.numberOfPages = 7
        pageControll.currentPage = 0
        pageControll.isUserInteractionEnabled = true
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    @IBAction func pageControllClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControll.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.scrollRectToVisible(rect, animated: true)
    }
}

