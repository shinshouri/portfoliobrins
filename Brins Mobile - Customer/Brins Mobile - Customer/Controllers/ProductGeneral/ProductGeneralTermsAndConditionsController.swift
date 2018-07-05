//
//  TermsAndConditionsController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductGeneralTermsAndConditionsControllerDelegate
{
    func goToPrevious()
    func goToNext()
}

// MARK: CONTROLLER

class ProductGeneralTermsAndConditionsController: UIViewController
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet var buttonNext: ButtonFormSecondary!
    
    var delegateProductGeneralTermsAndConditionsController: ProductGeneralTermsAndConditionsControllerDelegate?
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_TERMSANDCONDITIONS")
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
        delegateProductGeneralTermsAndConditionsController?.goToNext()
    }
}
