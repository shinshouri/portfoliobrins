//
//  LabelStyle.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: HEADER

class LabelHeaderMainTitle: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_TERTIARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Secondary.rawValue, size : FONT_HEADERMAIN_TITLE)
    }
}

class LabelHeaderThickTitle: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_TERTIARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Secondary.rawValue, size : FONT_HEADERTHICK_TITLE)
    }
}

class LabelHeaderControlTitle: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_TERTIARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Tertiary.rawValue, size : FONT_HEADERCONTROL_TITLE)
    }
}

class LabelHeaderFormTitle: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_PRIMARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Secondary.rawValue, size : FONT_HEADERFORM_TITLE)
    }
}

class LabelProductTitle: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_PRIMARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Secondary.rawValue, size : FONT_PRODUCTLIST_HEADER)
    }
}

class LabelProductDescription: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_PRIMARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Tertiary.rawValue, size : FONT_PRODUCTLIST_DESCRIPTION)
    }
}


// MARK: FORM

class LabelField: UILabel
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.textColor = generatorUIColor(intHexColor: THEME_FONT_PRIMARY, doubleOpacity: 1)
        self.font = UIFont(name : ENUM_FONT_FAMILY.Primary.rawValue, size : FONT_FIELD_SINGLE)
        self.textAlignment = .left
    }
}
