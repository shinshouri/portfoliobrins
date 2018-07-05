//
//  ChangePasswordController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 06/06/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

protocol ChangePasswordControllerDelegate
{
    func ShowSideMenu()
}

class ChangePasswordController: UIViewController {

    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var OldPassword: UITextField!
    @IBOutlet weak var NewPassword: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    var delegateChangePasswordController: ChangePasswordControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_CHANGEPASSWORD")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ActionChangePassword(sender: UIButton)
    {
        if (OldPassword.text! != NewPassword.text!)
        {
            if (NewPassword.text! == ConfirmPassword.text!)
            {
                
            }
            else
            {
                self.present(ShowAlertViewController(sender: self, title: L(""), message: L("")), animated: true, completion: nil)
            }
        }
        else
        {
            self.present(ShowAlertViewController(sender: self, title: L(""), message: L("")), animated: true, completion: nil)
        }
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
