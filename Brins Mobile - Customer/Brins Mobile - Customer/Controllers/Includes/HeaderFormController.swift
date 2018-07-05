//
//  HeaderFormController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 09/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: CONTROLLER

class HeaderFormController: UIView
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewHeaderForm: ViewHeaderForm!
    @IBOutlet var labelTitle: LabelHeaderFormTitle!
    @IBOutlet var imageViewTail: ImageViewHeaderTail!
    
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        
        // MARK: INITIALIZATION
        
        Bundle.main.loadNibNamed("HeaderFormView", owner: self, options: nil)
        self.addSubview(viewMain)
        
        viewMain.frame = self.bounds
    }
}
