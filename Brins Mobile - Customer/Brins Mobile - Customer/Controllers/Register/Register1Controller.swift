//
//  RegisterController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

// MARK: PROTOCOL

protocol Register1ControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class Register1Controller: UIViewController
{
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    var delegateRegister1Controller: Register1ControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_REGISTRATION1")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func Act(_ sender:UIButton) -> Void
    {
        if (sender.tag == 1)
        {
            
        }
    }
    
    @IBAction func NextButton(_ sender: Any)
    {
        delegateRegister1Controller?.goToNext()
    }
}
