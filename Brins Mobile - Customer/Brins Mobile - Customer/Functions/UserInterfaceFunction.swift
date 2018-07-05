//
//  UserInterfaceFunction.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 18/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit


// MARK: COLOR

/*
    generatorUIColor - START
    Description : Generate color with hex code.
    Author      : Ibrahim Aziz.
    Created on  : Wednesday, 18 April 2018.                 Updated on : Wednesday, 18 April 2018.
    Created by  : Ibrahim Aziz.                             Updated by : Ibrahim Aziz.
    Version     : 1.0.1.
*/

public func generatorUIColor(intHexColor : UInt32, doubleOpacity : Double = 1.0) -> UIColor
{
    let floatRedValue: CGFloat = CGFloat((intHexColor & 0xFF0000) >> 16) / 256.0
    let floatGreenValue: CGFloat = CGFloat((intHexColor & 0xFF00) >> 8) / 256.0
    let floatBlueValue: CGFloat = CGFloat(intHexColor & 0xFF) / 256.0
    
    return UIColor(red : floatRedValue, green : floatGreenValue, blue : floatBlueValue, alpha : CGFloat(doubleOpacity))
}

/* generatorUIColor - END */


// MARK: CONTROLLER

/*
    removeControllerChild - START
    Description : Remove child controller from parent controller.
    Author      : Ibrahim Aziz.
    Created on  : Friday, 11 May 2018.                      Updated on : Saturday, 12 May 2018.
    Created by  : Ibrahim Aziz.                             Updated by : Ibrahim Aziz.
    Version     : 1.0.2.
*/

public func removeControllerChild(controllerChild : UIViewController?) -> Void
{
    if (controllerChild == nil)
    {
        
    }
    else
    {
        controllerChild?.willMove(toParentViewController: nil)
        controllerChild?.view.removeFromSuperview()
        controllerChild?.removeFromParentViewController()
    }
}

/* removeControllerChild - END */


// MARK: CONTROLLER

/*
    updateProgressBarSection - START
    Description : Update progress bar section for form.
    Author      : Ibrahim Aziz.
    Created on  : Saturday, 12 May 2018.                      Updated on : Saturday, 12 May 2018.
    Created by  : Ibrahim Aziz.                             Updated by : Ibrahim Aziz.
    Version     : 1.0.1.
*/

public func updateProgressBarSection(controllerParent: UIViewController, stackViewProgressBarSection: StackViewProgressBarSection, viewProgressBarSectionComplete: ViewProgressBarSection, viewProgressBarSectionNotComplete: ViewProgressBarSection, intComplete: CGFloat, intTotal: CGFloat) -> Void
{
    let intScreenWidth: CGFloat = stackViewProgressBarSection.frame.width
    let intSectionWidth: CGFloat = intScreenWidth / intTotal
    let intCompleteWidth: CGFloat = intSectionWidth * intComplete
    let intNotComplete: CGFloat = intTotal - intComplete
    let intNotCompleteWidth: CGFloat = intSectionWidth * intNotComplete
    
    controllerParent.view.layoutIfNeeded()
    
    UIView.animate(withDuration: 1.0, animations:
    {
        viewProgressBarSectionComplete.frame.size = CGSize(width: intCompleteWidth, height: BORDER_WIDTH_THICK)
        viewProgressBarSectionNotComplete.frame.size = CGSize(width: intNotCompleteWidth, height: BORDER_WIDTH_THICK)
        
        controllerParent.view.layoutIfNeeded()
    })
}

/* updateProgressBarSection - END */

/*
 moveStoryboard - START
 Description : Navigate between storyboard.
 Author      : Michael Carolius.
 Created on  : Wednesday, 16 May 2018.              Updated on : Wednesday, 16 May 2018.
 Created by  : Michael Carolius.                    Updated by : Michael Carolius.
 Version     : 1.0.1.
 */

public func moveStoryboard(sender:UIViewController, StoryboardName:String, StoryboardID:String) -> Void
{
    let storyboard = UIStoryboard(name: StoryboardName, bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: StoryboardID) as UIViewController
    sender.present(vc, animated: true, completion: nil)
}

/* moveStoryboard - END */

/*
 moveContainer - START
 Description : Navigate between container.
 Author      : Michael Carolius.
 Created on  : Wednesday, 16 May 2018.              Updated on : Wednesday, 16 May 2018.
 Created by  : Michael Carolius.                    Updated by : Michael Carolius.
 Version     : 1.0.1.
 */
public func moveContainer(sender:UIViewController ,container: UIView, controller: UIViewController, StoryboardName:String, StoryboardID:String) -> Void
{
    let vc = UIStoryboard(name: StoryboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardID) as UIViewController
    vc.willMove(toParentViewController: sender)
    container.willRemoveSubview(controller.view)
    container.addSubview(vc.view)
    sender.addChildViewController(vc)
    vc.didMove(toParentViewController: sender)
}

/* moveContainer - END */

//func mac_md5(dataString: String) -> (NSData?) {
//    let data = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding) as NSData?
//    let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
//    if (data.length > 0) {
//        CC_MD5(data.bytes,
//               CC_LONG(data.length),
//               UnsafeMutablePointer<UInt8>(result.mutableBytes))
//    }
//    return result
//}


