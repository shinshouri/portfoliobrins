//
//  ProductOtoPackageController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 17/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductOtoPackageControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductOtoPackageController: UIViewController,
    UIScrollViewDelegate
{
    // MARK: USER INTERFACE COMPONENT
    var delegateProductOtoPackageController: ProductOtoPackageControllerDelegate?
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var pageControl : UIPageControl!
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: DELEGATE
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let width: CGFloat! = scrollView.frame.size.width;
        let page: CGFloat! = (scrollView.contentOffset.x + (0.5 * width)) / width;
        
        pageControl.currentPage = Int(page)
    }
    
    // MARK: ACTION
    
    @IBAction func goToNext(sender: UIButton)
    {
        if sender.tag == 1
        {
            NSLog("1")
        }
        else if sender.tag == 2
        {
            NSLog("2")
        }
        else if sender.tag == 3
        {
            NSLog("3")
        }
        else if sender.tag == 4
        {
            NSLog("4")
        }
        delegateProductOtoPackageController?.goToNext()
    }
}
