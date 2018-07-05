//
//  SPPAController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductAsriSPPAControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductAsriSPPAController: UIViewController
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet var labelAssuredName: LabelField!
    @IBOutlet var labelAssuredAddress: LabelField!
    @IBOutlet var labelBuildingAddress: LabelField!
    @IBOutlet var labelAssuredEmail: LabelField!
    @IBOutlet var labelAssuredMobilePhone: LabelField!
    
    @IBOutlet var textFieldAssuredName: TextFieldGeneralSingle!
    @IBOutlet var textFieldAssuredAddress: TextFieldGeneralTripple!
    @IBOutlet var textFieldBuildingAddress: TextFieldGeneralTripple!
    @IBOutlet var textFieldAssuredEmail: TextFieldGeneralSingle!
    @IBOutlet var textFieldAssuredMobilePhone: TextFieldGeneralSingle!
    
    @IBOutlet var buttonNext: ButtonFormSecondary!
    
    var delegateProductAsriSPPAController: ProductAsriSPPAControllerDelegate?
    
    
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
        delegateProductAsriSPPAController?.goToNext()
    }
}
