//
//  HeaderMainController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 23/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: CONTROLLER

class HeaderMainController: UIView
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var viewHeaderMain: ViewHeaderMain!
    @IBOutlet var labelTitle: LabelHeaderMainTitle!
    @IBOutlet var buttonNavigation: ButtonNavigationOpen!
    @IBOutlet var imageViewLogo: ImageViewHeaderMainLogo!
    
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        
        // MARK: INITIALIZATION
        
        Bundle.main.loadNibNamed("HeaderMainView", owner: self, options: nil)
        self.addSubview(viewHeaderMain)
        
        viewHeaderMain.frame = self.bounds
    }
}
