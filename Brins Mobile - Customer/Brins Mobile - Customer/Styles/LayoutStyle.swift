//
//  LayoutStyles.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: HEADER

class ViewHeaderMain : UIView
{
    required init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_PRIMARY, doubleOpacity: 1.0)
    }
}

class ViewHeaderThick : UIView
{
    required init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_PRIMARY, doubleOpacity: 1.0)
    }
}

class ViewHeaderControl : UIView
{
    required init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_PRIMARY, doubleOpacity: 1.0)
    }
}

class ViewHeaderForm : UIView
{
    required init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SENARY, doubleOpacity: 1.0)
    }
}

class ViewBottomLogin : UIView
{
    required init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_QUATERNARY, doubleOpacity: 1.0)
    }
}


// MARK: PROGRESS BAR SECTION

public class StackViewProgressBarSection : UIStackView
{
    required public init(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SENARY, doubleOpacity: 1.0)
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
    }
}

public class ViewProgressBarSection : UIView
{
    required public init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: BORDER_WIDTH_THICK).isActive = true
    }
    
    public func Complete() -> Void
    {
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_TERTIARY, doubleOpacity: 1.0)
    }
    
    public func NotComplete() -> Void
    {
        self.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SENARY, doubleOpacity: 1.0)
    }
}


// MARK: FORM

class StackViewFormVertical : UIStackView
{
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = SPACE_HUGE
    }
}

class StackViewQuestionVertical : UIStackView
{
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = SPACE_MEDIUM
    }
}

class StackViewQuestionHorizontal : UIStackView
{
    required init(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .center
        self.spacing = SPACE_MEDIUM
    }
}


//MARK: PAGE CONTROL

class PageControl: UIPageControl
{
    required public init?(coder aDecoder: (NSCoder))
    {
        super.init(coder: aDecoder)
        
        self.pageIndicatorTintColor = generatorUIColor(intHexColor: THEME_GENERAL_QUINARY, doubleOpacity: 1.0)
        self.currentPageIndicatorTintColor = generatorUIColor(intHexColor: THEME_GENERAL_TERTIARY, doubleOpacity: 1.0)
        self.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
}
//MARK: TABLE VIEW CELL

class TableViewCellProductList: UITableViewCell
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var descProduct: UILabel!
    @IBOutlet weak var buttonProduct: UIButton!
    
    // MARK: REQUIRED
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
    }
}
