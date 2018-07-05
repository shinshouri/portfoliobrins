//
//  InputFunction.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit



// MARK: TEXTFIELD

/*
 TextfieldChangeEnabled - START
 Description : Change property textfield when enabled/disabled.
 Author      : Michael Carolius.
 Created on  : Wednesday, 25 May 2018.              Updated on : Wednesday, 25 May 2018.
 Created by  : Michael Carolius.                    Updated by : Michael Carolius.
 Version     : 1.0.1.
 */
func TextfieldChangeEnabled(sender: UITextField, state:Bool) -> Void {
    sender.isEnabled = state
    if state
    {
        sender.backgroundColor = .clear
    }
    else
    {
        sender.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SEPTENARY, doubleOpacity: 1.0)
    }
}

/* TextfieldChangeEnabled - END */

// MARK: ALERTVIEWCONTROLLER

/*
 ShowAlertViewController - START
 Description : Set alert property before show.
 Author      : Michael Carolius.
 Created on  : Wednesday, 25 May 2018.              Updated on : Wednesday, 25 May 2018.
 Created by  : Michael Carolius.                    Updated by : Michael Carolius.
 Version     : 1.0.1.
 */
func ShowAlertViewController(sender: UIViewController, title:String, message:String) -> UIAlertController
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
        
    })
    alertController.addAction(cancelButton)
    
    return alertController
}

/* ShowAlertViewController - END */

/*
 ShowAlertSheetViewController - START
 Description : Set alert property before show.
 Author      : Michael Carolius.
 Created on  : Wednesday, 25 May 2018.              Updated on : Wednesday, 25 May 2018.
 Created by  : Michael Carolius.                    Updated by : Michael Carolius.
 Version     : 1.0.1.
 */
func ShowAlertSheetViewController(sender: UIViewController, title:String, message:String) -> UIAlertController
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
        
    })
    alertController.addAction(cancelButton)
    
    return alertController
}

/* ShowAlertViewController - END */
