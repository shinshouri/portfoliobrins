//
//  Register4Controller.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit


// MARK: PROTOCOL

protocol Register4ControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class Register4Controller: UIViewController
{
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var IDNumber: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var Gender: UISegmentedControl!
    @IBOutlet weak var BirthDate: UITextField!
    
    var delegateRegister4Controller: Register4ControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_REGISTRATION4")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextButton(_ sender: Any)
    {
        delegateRegister4Controller?.goToNext()
    }
}
