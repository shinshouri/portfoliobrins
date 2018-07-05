//
//  ImageStyle.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: HEADER

class ImageViewHeaderMainLogo: UIImageView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: LOGO_HEIGHT_HEADERMAIN).isActive = true
        self.widthAnchor.constraint(equalToConstant: LOGO_WIDTH_HEADERMAIN).isActive = true
        self.backgroundColor = UIColor.clear
        self.image = UIImage(named: "logo_mainprimary_header")
    }
}

class ImageViewHeaderTail: UIImageView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: SHAPE_HEIGHT_HEADERTAIL).isActive = true
        self.widthAnchor.constraint(equalToConstant: SHAPE_WIDTH_HEADERTAIL).isActive = true
        self.backgroundColor = UIColor.clear
        self.image = UIImage(named: "shape_header_tail")
    }
}

class ImageViewHeaderLogin: UIImageView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: LOGO_HEIGHT_LOGINMAIN).isActive = true
        self.widthAnchor.constraint(equalToConstant: LOGO_WIDTH_LOGINMAIN).isActive = true
        self.backgroundColor = UIColor.clear
        self.image = UIImage(named: "logo_mainprimary_login")
    }
}

// MARK: FOOTER

class ImageViewFooterGeneral: UIImageView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.heightAnchor.constraint(equalToConstant: SHAPE_HEIGHT_FOOTERGENERAL).isActive = true
        self.image = UIImage(named: "shape_footer_general")
    }
}
