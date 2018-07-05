//
//  ButtonStyle.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: HEADER

class ButtonNavigation: UIButton
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: IMAGEBUTTON_SIZE_NAVIGATIONTRIGGER).isActive = true
        self.widthAnchor.constraint(equalToConstant: IMAGEBUTTON_SIZE_NAVIGATIONTRIGGER).isActive = true
        self.backgroundColor = UIColor.clear
        self.setTitle("", for: .normal)
    }
}

class ButtonNavigationOpen: ButtonNavigation
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.setImage(UIImage(named: "icon_navigation_open")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}

class ButtonControl: UIButton
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: BUTTON_SIZE_HEADERCONTROL).isActive = true
        self.widthAnchor.constraint(equalToConstant: BUTTON_SIZE_HEADERCONTROL).isActive = true
        self.backgroundColor = UIColor.clear
        self.setTitle("", for: .normal)
    }
}

class ButtonControlPrevious: ButtonControl
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.setImage(UIImage(named: "icon_previous_enable")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.setImage(UIImage(named: "icon_previous_disable")?.withRenderingMode(.alwaysOriginal), for: .disabled)
    }
}

class ButtonControlNext: ButtonControl
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.setImage(UIImage(named: "icon_next_enable")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.setImage(UIImage(named: "icon_next_disable")?.withRenderingMode(.alwaysOriginal), for: .disabled)
    }
}


// MARK: NAVIGATION

class ButtonNavigationClose: ButtonNavigation
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.setImage(UIImage(named: "icon_navigation_close"), for: .normal);
    }
}

class ButtonNavigationLogin: UIButton
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.tintColor = UIColor.white
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_NONARY, doubleOpacity: 1.0)
    }
}

// MARK: FORM

class ButtonForm: UIButton
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT_FORM).isActive = true
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: BUTTON_WIDTH_FORM).isActive = true
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: SPACE_LARGE, bottom: 0, right: SPACE_LARGE)
        self.titleLabel?.textColor = generatorUIColor(intHexColor: THEME_FONT_TERTIARY, doubleOpacity: 1.0)
        self.titleLabel?.font = UIFont(name: ENUM_FONT_FAMILY.Tertiary.rawValue, size: FONT_BUTTON_FORM)
        self.layer.cornerRadius = BUTTON_RADIUS_FORM
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = BORDER_WIDTH_THIN
        self.tintColor = generatorUIColor(intHexColor: THEME_FONT_TERTIARY, doubleOpacity: 1.0)
        self.titleLabel?.textAlignment = .center
        self.contentVerticalAlignment = .center
    }
}

class ButtonFormPrimary: ButtonForm
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_PRIMARY, doubleOpacity: 1.0)
    }
}

class ButtonFormSecondary: ButtonForm
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_TERTIARY, doubleOpacity: 1.0)
    }
}

class ButtonFormRefreshPrimary: ButtonForm
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_PRIMARY, doubleOpacity: 1.0)
    }
}

class ButtonFormRefreshSecondary: ButtonForm
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_TERTIARY, doubleOpacity: 1.0)
    }
}

class ButtonFormDropDown: ButtonForm
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 0
        self.backgroundColor = UIColor.clear
        self.setBackgroundImage(UIImage(named: "shape_headerform_tail")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}
