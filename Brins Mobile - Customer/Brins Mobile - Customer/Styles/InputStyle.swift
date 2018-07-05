//
//  InputStyle.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// TEXTFIELD

class TextFieldGeneral: UITextField
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.borderStyle = .none
        self.layer.borderColor = generatorUIColor(intHexColor: THEME_GENERAL_QUINARY, doubleOpacity: 1.0).cgColor
        self.layer.borderWidth = BORDER_WIDTH_MEDIUM
        self.layer.cornerRadius = INPUT_RADIUS_FORM
        self.font = UIFont(name: ENUM_FONT_FAMILY.Primary.rawValue, size: FONT_INPUT_SINGLE)
    }
}

class TextFieldGeneralSingle : TextFieldGeneral
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: INPUT_HEIGHT_SINGLE).isActive = true
    }
}

class TextFieldGeneralDouble : TextFieldGeneral
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: INPUT_HEIGHT_DOUBLE).isActive = true
    }
}

class TextFieldGeneralTripple : TextFieldGeneral
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: INPUT_HEIGHT_TRIPLE).isActive = true
    }
}
