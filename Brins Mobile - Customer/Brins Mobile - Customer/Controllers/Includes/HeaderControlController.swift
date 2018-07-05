//
//  HeaderControlController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 09/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: PROTOCOL

protocol HeaderControlControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class HeaderControlController: UIView
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var viewHeaderControl: ViewHeaderControl!
    
    @IBOutlet var labelTitle: LabelHeaderControlTitle!
    
    @IBOutlet var buttonPrevious: ButtonControlPrevious!
    @IBOutlet var buttonNext: ButtonControlNext!
    
    @IBOutlet var stackViewProgressBarSection: StackViewProgressBarSection!
    @IBOutlet var viewProgressBarSectionComplete: ViewProgressBarSection!
    @IBOutlet var viewProgressBarSectionNotComplete: ViewProgressBarSection!
    
    var delegateHeaderCotrolController : HeaderControlControllerDelegate?
    
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        
        // MARK: INITIALIZATION
        
        Bundle.main.loadNibNamed("HeaderControlView", owner: self, options: nil)
        self.addSubview(viewHeaderControl)
        
        viewHeaderControl.frame = self.bounds
        
        viewProgressBarSectionComplete.Complete()
        viewProgressBarSectionNotComplete.NotComplete()
    }
    
    
    // MARK: ACTION
    
    @IBAction func goToPrevious(sender: UIButton)
    {
        delegateHeaderCotrolController?.goToPrevious()
    }
    
    @IBAction func goToNext(sender: UIButton)
    {
        delegateHeaderCotrolController?.goToNext()
    }
}
