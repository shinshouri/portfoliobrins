//
//  MainController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 09/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit

// MARK: PROTOCOL

protocol ProductAsriMainControllerDelegate
{
    func GoToPage(Controller:String)
    func ShowSideMenu()
}


// MARK: CONTROLLER

class ProductAsriMainController: UIViewController,
    HeaderControlControllerDelegate,
    ProductAsriPackageControllerDelegate,
    ProductAsriBuildingInformationControllerDelegate,
    ProductAsriSPPAControllerDelegate,
    ProductAsriDocumentCaptureControllerDelegate,
    ProductGeneralDiscountControllerDelegate,
    ProductGeneralCalculatePremiControllerDelegate,
    ProductGeneralTermsAndConditionsControllerDelegate
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderControl: HeaderControlController!
    
    @IBOutlet var viewContainerMain: UIView!
    
    var delegateProductAsriMainController: ProductAsriMainControllerDelegate?
    var storyboardMain: UIStoryboard!
    var storyboardProductAsri: UIStoryboard!
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
        storyboardProductAsri = UIStoryboard(name: "ProductAsriStoryboard", bundle: Bundle.main)
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
            delegateProductAsriMainController?.ShowSideMenu()
        }
    }
    
    
    // MARK: CONTROLLER DECLARATION
    
    private lazy var controllerProductList: ProductListController =
    {
        var controllerChild = storyboardMain.instantiateViewController(withIdentifier: "ProductListController") as! ProductListController
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerPackage: ProductAsriPackageController =
    {
        var controllerChild = storyboardProductAsri.instantiateViewController(withIdentifier: "PackageController") as! ProductAsriPackageController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductAsriPackageController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerBuildingInformation: ProductAsriBuildingInformationController =
    {
        var controllerChild = storyboardProductAsri.instantiateViewController(withIdentifier: "BuildingInformationController") as! ProductAsriBuildingInformationController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductAsriBuildingInformationController = self
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
    
    private lazy var controllerSPPA: ProductAsriSPPAController =
    {
        var controllerChild = storyboardProductAsri.instantiateViewController(withIdentifier: "SPPAController") as! ProductAsriSPPAController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductAsriSPPAController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerDocumentCapture: ProductAsriDocumentCaptureController =
    {
        var controllerChild = storyboardProductAsri.instantiateViewController(withIdentifier: "DocumentCaptureController") as! ProductAsriDocumentCaptureController
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateProductAsriDocumentCaptureController = self
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
        if let controllerPackage = segue.destination as? ProductAsriPackageController,
            segue.identifier == "PackageSegue"
        {
            controllerPackage.delegateProductAsriPackageController = self
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
        
        updateProgressBarSection(controllerParent: self, stackViewProgressBarSection: controllerHeaderControl.stackViewProgressBarSection, viewProgressBarSectionComplete: controllerHeaderControl.viewProgressBarSectionComplete, viewProgressBarSectionNotComplete: controllerHeaderControl.viewProgressBarSectionNotComplete, intComplete: section, intTotal: ASRI_SECTION_TOTAL)
    }
    
    public func goToProductList()
    {
        delegateProductAsriMainController?.GoToPage(Controller: "ProductList")
//        moveStoryboard(sender: self, StoryboardName: "MainStoryboard", StoryboardID: "ProductList")
    }
    
    public func goToPackage()
    {
        self.childChangeController(viewController: controllerPackage, section: 0)
    }
    
    public func goToBuildingInformation()
    {
        self.childChangeController(viewController: controllerBuildingInformation, section: 1)
    }
    
    public func goToDiscount()
    {
        self.childChangeController(viewController: controllerDiscount, section: 2)
    }
    
    public func goToCalculatePremi()
    {
        self.childChangeController(viewController: controllerCalculatePremi, section: 3)
    }
    
    public func goToSPPA()
    {
        self.childChangeController(viewController: controllerSPPA, section: 4)
    }
    
    public func goToDocumentCapture()
    {
        self.childChangeController(viewController: controllerDocumentCapture, section: 5)
    }
    
    public func goToTermsAndConditions()
    {
        self.childChangeController(viewController: controllerTermsAndConditions, section: 6)
    }
}


// MARK: NAVIGATION DELEGATE

extension ProductAsriMainController
{
    public func goToPrevious() -> Void
    {
        if (controllerChildCurrent == controllerPackage)
        {
            goToProductList()
        }
        else if (controllerChildCurrent == controllerBuildingInformation)
        {
            goToPackage()
        }
        else if (controllerChildCurrent == controllerDiscount)
        {
            goToBuildingInformation()
        }
        else if (controllerChildCurrent == controllerCalculatePremi)
        {
            goToDiscount()
        }
        else if (controllerChildCurrent == controllerSPPA)
        {
            goToCalculatePremi()
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
            goToBuildingInformation()
        }
        else if (controllerChildCurrent == controllerBuildingInformation)
        {
            goToDiscount()
        }
        else if (controllerChildCurrent == controllerDiscount)
        {
            goToCalculatePremi()
        }
        else if (controllerChildCurrent == controllerCalculatePremi)
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
