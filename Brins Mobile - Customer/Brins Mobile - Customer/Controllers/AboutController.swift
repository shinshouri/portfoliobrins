//
//  AboutUsController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 31/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import UIKit


// MARK: PROTOCOL

protocol AboutControllerDelegate
{
    func ShowSideMenu()
}

// MARK: CONTROLLER

class AboutController: UIViewController {
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    var delegateAboutController: AboutControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controllerHeaderForm.labelTitle.text = L("About Us")
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
