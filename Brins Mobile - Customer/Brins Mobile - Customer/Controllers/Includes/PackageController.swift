//
//  PackageController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 12/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: PROTOCOL

protocol PackageControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class PackageController: UIView
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var viewMain: UIView!
    
    @IBOutlet var labelTitle: LabelHeaderControlTitle!
    @IBOutlet var labelDescription: ViewProgressBarSection!
    
    @IBOutlet var buttonSelect: ButtonControlPrevious!
    
    @IBOutlet var imageViewIcon: ButtonControlNext!
    
    @IBOutlet var stackViewBenefits: StackViewProgressBarSection!
    
    var arrayBenefits: Array<String>!
    
    var delegatePackageController : PackageControllerDelegate?
    
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        
        // MARK: INITIALIZATION
        
        Bundle.main.loadNibNamed("PackageView", owner: self, options: nil)
        self.addSubview(viewMain)
        
        viewMain.frame = self.bounds
        
        
        // MARK: GENERATE BENEFITS
        
        if (arrayBenefits.count > 0)
        {
//            for intRow in 0 ..< arrayBenefits.count
//            {
//                
//            }
        }
        else
        {
            
        }
    }
    
    
    // MARK: ACTION
    
    @IBAction func goToNext(sender: UIButton)
    {
        delegatePackageController?.goToNext()
    }
}
