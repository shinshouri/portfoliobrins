//
//  Register3Controller.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

// MARK: PROTOCOL

protocol Register3ControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class Register3Controller: UIViewController
{
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    var delegateRegister3Controller: Register3ControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_REGISTRATION3")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ResendButton(_ sender: Any)
    {
        
    }
    
    @IBAction func NextButton(_ sender: Any)
    {
        delegateRegister3Controller?.goToNext()
    }
}
