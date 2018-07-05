//
//  ChangeEmailController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 06/06/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

protocol ChangeEmailControllerDelegate
{
    func ShowSideMenu()
}

class ChangeEmailController: UIViewController, UITextFieldDelegate
{

    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var Email: UITextField!
    
    var delegateChangeEmailController: ChangeEmailControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_CHANGEEMAIL")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) {
            return false
        }
        
        return false
    }
    
    @IBAction func ActionChangeEmail(sender: UIButton)
    {
        
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
