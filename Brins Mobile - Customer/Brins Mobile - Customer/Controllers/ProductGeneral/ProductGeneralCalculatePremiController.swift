//
//  CalculatePremiController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductGeneralCalculatePremiControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductGeneralCalculatePremiController: UIViewController
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet var labelPremiBasic: LabelField!
    @IBOutlet var labelDiscount: LabelField!
    @IBOutlet var labelAdministrationFee: LabelField!
    @IBOutlet var labelPremiTotal: LabelField!
    
    @IBOutlet var textFieldPremiBasic: TextFieldGeneralSingle!
    @IBOutlet var textFieldDiscount: TextFieldGeneralSingle!
    @IBOutlet var textFieldAdministrationFee: TextFieldGeneralSingle!
    @IBOutlet var textFieldPremiTotal: TextFieldGeneralSingle!
    
    @IBOutlet var buttonNext: ButtonFormSecondary!
    
    var delegateProductGeneralCalculatePremiController: ProductGeneralCalculatePremiControllerDelegate?
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_SPPA")
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: ACTION
    
    @IBAction func goToNext(sender: UIButton)
    {
        delegateProductGeneralCalculatePremiController?.goToNext()
    }
}

