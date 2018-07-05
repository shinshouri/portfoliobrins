//
//  HeaderThickController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 09/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: CONTROLLER

class HeaderThickController: UIView
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var viewHeaderThick: ViewHeaderThick!
    @IBOutlet var labelTitle: LabelHeaderThickTitle!
    @IBOutlet var stackViewProgressBarSection: StackViewProgressBarSection!
    @IBOutlet var viewProgressBarSectionComplete: ViewProgressBarSection!
    @IBOutlet var viewProgressBarSectionNotComplete: ViewProgressBarSection!
    
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        
        // MARK: INITIALIZATION
        
        Bundle.main.loadNibNamed("HeaderThickView", owner: self, options: nil)
        self.addSubview(viewHeaderThick)
        
        viewHeaderThick.frame = self.bounds
        
        viewProgressBarSectionComplete.Complete()
        viewProgressBarSectionNotComplete.NotComplete()
    }
}
