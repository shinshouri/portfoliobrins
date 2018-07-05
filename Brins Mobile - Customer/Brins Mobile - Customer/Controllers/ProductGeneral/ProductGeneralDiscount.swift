//
//  ProductGeneralDiscount.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 12/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductGeneralDiscountControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductGeneralDiscountController: UIViewController
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet var labelDiscount: LabelField!
    
    @IBOutlet var textFieldDiscount: TextFieldGeneralSingle!
    
    @IBOutlet var switchDiscount: UISwitch!
    
    @IBOutlet var buttonNext: ButtonFormSecondary!
    
    var delegateProductGeneralDiscountController: ProductGeneralDiscountControllerDelegate?
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_PROMOTION")
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
        delegateProductGeneralDiscountController?.goToNext()
    }
}

