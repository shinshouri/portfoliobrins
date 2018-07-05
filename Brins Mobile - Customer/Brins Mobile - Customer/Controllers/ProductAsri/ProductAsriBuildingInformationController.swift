//
//  BuildingInformationController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductAsriBuildingInformationControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductAsriBuildingInformationController: UIViewController
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet var labelBuildingValue: LabelField!
    @IBOutlet var labelBuildingInterior: LabelField!
    @IBOutlet var labelAssuredAddress: LabelField!
    @IBOutlet var labelBuildingAddress: LabelField!
    @IBOutlet var labelPostalCode: LabelField!
    @IBOutlet var labelPostalName: LabelField!
    @IBOutlet var labelCity: LabelField!
    @IBOutlet var labelProvince: LabelField!
    @IBOutlet var labelBuildingAddressSameWithAssuredAddress: LabelField!
    
    @IBOutlet var textFieldBuildingValue: TextFieldGeneralSingle!
    @IBOutlet var textFieldBuildingInterior: TextFieldGeneralSingle!
    @IBOutlet var textFieldAssuredAddress: TextFieldGeneralTripple!
    @IBOutlet var textFieldBuildingAddress: TextFieldGeneralTripple!
    @IBOutlet var textFieldPostalCode: TextFieldGeneralSingle!
    @IBOutlet var textFieldPostalName: TextFieldGeneralSingle!
    @IBOutlet var textFieldCity: TextFieldGeneralSingle!
    @IBOutlet var textFieldProvince: TextFieldGeneralSingle!
    
    @IBOutlet var switchBuildingAddressSameWithAssuredAddress: UISwitch!
    
    @IBOutlet var buttonCheck : ButtonFormRefreshSecondary!
    @IBOutlet var buttonNext: ButtonFormSecondary!
    
    var delegateProductAsriBuildingInformationController: ProductAsriBuildingInformationControllerDelegate?
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_BUILDINGINFORMATION")
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
        delegateProductAsriBuildingInformationController?.goToNext()
    }
}
