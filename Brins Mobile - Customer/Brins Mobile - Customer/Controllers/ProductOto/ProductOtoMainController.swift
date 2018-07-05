//
//  ProductOtoMainController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 17/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: PROTOCOL

protocol ProductOtoMainControllerDelegate
{
    func GoToPage(Controller:String)
    func ShowSideMenu()
}


// MARK: CONTROLLER

class ProductOtoMainController: UIViewController,
    HeaderControlControllerDelegate,
    ProductOtoPackageControllerDelegate,
    ProductOtoVehicleInformationControllerDelegate,
    ProductOtoIllustrationControllerDelegate,
    ProductOtoSPPAControllerDelegate,
    ProductOtoDocumentCaptureControllerDelegate,
    ProductGeneralDiscountControllerDelegate,
    ProductGeneralCalculatePremiControllerDelegate,
    ProductGeneralTermsAndConditionsControllerDelegate
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderControl: HeaderControlController!
    @IBOutlet var viewContainerMain: UIView!
    
    var delegateProductOtoMainController: ProductOtoMainControllerDelegate?
    var storyboardMain: UIStoryboard!
    var storyboardProductOto: UIStoryboard!
    var storyboardProductGeneral: UIStoryboard!
    var controllerChildCurrent: UIViewController!
    var controllerChildPrevious: UIViewController!
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // MARK: LOCALIZABLE
        
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_PACKAGE")
        
        
        // MARK: INITIATE USER INTERFACE
        
        controllerHeaderControl.delegateHeaderCotrolController = self
        controllerHeaderControl.buttonNext.isEnabled = false
        
        storyboardMain = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main)
        storyboardProductOto = UIStoryboard(name: "ProductOtoStoryboard", bundle: Bundle.main)
        storyboardProductGeneral = UIStoryboard(name: "ProductGeneralStoryboard", bundle: Bundle.main)
        controllerChildCurrent = controllerPackage
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func Act(_ sender:UIButton) -> Void
    {
        if(sender.tag == 5)
        {
            delegateProductOtoMainController?.ShowSideMenu()
        }
    }
    
    // MARK: CONTROLLER DECLARATION
    
    private lazy var controllerPackage: ProductOtoPackageController =
    {
        var controllerChild = storyboardProductOto.instantiateViewController(withIdentifier: "PackageController") as! ProductOtoPackageController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductOtoPackageController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerVehicleInformation: ProductOtoVehicleInformationController =
    {
        var controllerChild = storyboardProductOto.instantiateViewController(withIdentifier: "InformationController") as! ProductOtoVehicleInformationController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductOtoVehicleInformationController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerIllustration: ProductOtoIllustrationController =
    {
        var controllerChild = storyboardProductOto.instantiateViewController(withIdentifier: "IllustrationController") as! ProductOtoIllustrationController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductOtoIllustrationController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerDiscount: ProductGeneralDiscountController =
    {
        var controllerChild = storyboardProductGeneral.instantiateViewController(withIdentifier: "DiscountController") as! ProductGeneralDiscountController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductGeneralDiscountController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerCalculatePremi: ProductGeneralCalculatePremiController =
    {
        var controllerChild = storyboardProductGeneral.instantiateViewController(withIdentifier: "CalculatePremiController") as! ProductGeneralCalculatePremiController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductGeneralCalculatePremiController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerSPPA: ProductOtoSPPAController =
    {
        var controllerChild = storyboardProductOto.instantiateViewController(withIdentifier: "SPPAController") as! ProductOtoSPPAController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductOtoSPPAController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerDocumentCapture: ProductOtoDocumentCaptureController =
    {
        var controllerChild = storyboardProductOto.instantiateViewController(withIdentifier: "DocumentCaptureController") as! ProductOtoDocumentCaptureController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductOtoDocumentCaptureController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerTermsAndConditions: ProductGeneralTermsAndConditionsController =
    {
        var controllerChild = storyboardProductGeneral.instantiateViewController(withIdentifier: "TermsAndConditionsController") as! ProductGeneralTermsAndConditionsController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductGeneralTermsAndConditionsController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    
    // MARK: CONTROLLER NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let controllerPackage = segue.destination as? ProductOtoPackageController,
            segue.identifier == "PackageSegue"
        {
            controllerPackage.delegateProductOtoPackageController = self
        }
        else
        {
            
        }
    }
    
    private func childChangeController(viewController:UIViewController, section:CGFloat)
    {
        controllerChildPrevious = controllerChildCurrent
        self.viewContainerMain.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
        removeControllerChild(controllerChild: controllerChildCurrent)
        controllerChildCurrent = viewController
        
        updateProgressBarSection(controllerParent: self, stackViewProgressBarSection: controllerHeaderControl.stackViewProgressBarSection, viewProgressBarSectionComplete: controllerHeaderControl.viewProgressBarSectionComplete, viewProgressBarSectionNotComplete: controllerHeaderControl.viewProgressBarSectionNotComplete, intComplete: section, intTotal: OTO_SECTION_TOTAL)
    }
    
    public func goToProductList()
    {
        delegateProductOtoMainController?.GoToPage(Controller: "ProductList")
    }
    
    public func goToPackage()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_PACKAGE")
        
        self.childChangeController(viewController: controllerPackage, section: 0)
    }
    
    public func goToInformation()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerVehicleInformation, section: 1)
    }
    
    public func goToDiscount()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerDiscount, section: 2)
    }
    
    public func goToIllustration()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerIllustration, section: 3)
    }
    
    public func goToSPPA()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerSPPA, section: 4)
    }
    
    public func goToDocumentCapture()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerDocumentCapture, section: 5)
    }
    
    public func goToTermsAndConditions()
    {
        controllerHeaderControl.labelTitle.text = L("HEADER_CONTROL_FORM")
        
        self.childChangeController(viewController: controllerTermsAndConditions, section: 6)
    }
}


// MARK: NAVIGATION DELEGATE

extension ProductOtoMainController
{
    public func goToPrevious() -> Void
    {
        if (controllerChildCurrent == controllerPackage)
        {
            goToProductList()
        }
        else if (controllerChildCurrent == controllerVehicleInformation)
        {
            goToPackage()
        }
        else if (controllerChildCurrent == controllerDiscount)
        {
            goToInformation()
        }
        else if (controllerChildCurrent == controllerIllustration)
        {
            goToDiscount()
        }
        else if (controllerChildCurrent == controllerSPPA)
        {
            goToIllustration()
        }
        else if (controllerChildCurrent == controllerDocumentCapture)
        {
            goToSPPA()
        }
        else if (controllerChildCurrent == controllerTermsAndConditions)
        {
            goToDocumentCapture()
        }
        else
        {
            goToProductList()
        }
    }
    
    public func goToNext() -> Void
    {
        if (controllerChildCurrent == controllerPackage)
        {
            goToInformation()
        }
        else if (controllerChildCurrent == controllerVehicleInformation)
        {
            goToDiscount()
        }
        else if (controllerChildCurrent == controllerDiscount)
        {
            goToIllustration()
        }
        else if (controllerChildCurrent == controllerIllustration)
        {
            goToSPPA()
        }
        else if (controllerChildCurrent == controllerSPPA)
        {
            goToDocumentCapture()
        }
        else if (controllerChildCurrent == controllerDocumentCapture)
        {
            goToTermsAndConditions()
        }
        else
        {
            goToProductList()
        }
    }
}
