//
//  Register2Controller.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit


// MARK: PROTOCOL

protocol Register2ControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class Register2Controller: UIViewController
{
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    var delegateRegister2Controller: Register2ControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_REGISTRATION2")
    }
    
    @IBAction func ResendButton(_ sender: Any)
    {
        
    }
    
    @IBAction func NextButton(_ sender: Any)
    {
        delegateRegister2Controller?.goToNext()
    }
}
