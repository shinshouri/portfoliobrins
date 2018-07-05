//
//  RegisterMainController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 30/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

// MARK: PROTOCOL

protocol RegisterControllerDelegate
{
    func GoToPage(Controller:String)
    func ShowSideMenu()
}

// MARK: CONTROLLER

class RegisterMainController: ParentViewController,
    HeaderControlControllerDelegate,
    Register1ControllerDelegate,
    Register2ControllerDelegate,
    Register3ControllerDelegate,
    Register4ControllerDelegate
{
    @IBOutlet var controllerHeaderControl: HeaderControlController!
    @IBOutlet var viewContainerMain: UIView!
    
    var delegateRegisterController: RegisterControllerDelegate?
    var storyboardMain: UIStoryboard!
    var storyboardRegister: UIStoryboard!
    var controllerChildCurrent: UIViewController!
    var controllerChildPrevious: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        controllerHeaderControl.delegateHeaderCotrolController = self
        controllerHeaderControl.buttonNext.isEnabled = false
        
        storyboardMain = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main)
        storyboardRegister = UIStoryboard(name: "RegisterStoryboard", bundle: Bundle.main)
        controllerChildCurrent = controllerRegister1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func Act(_ sender:UIButton) -> Void
    {
        if(sender.tag == 5)
        {
            delegateRegisterController?.ShowSideMenu()
        }
    }

    private lazy var controllerRegister1: Register1Controller =
    {
        var controllerChild = storyboardRegister.instantiateViewController(withIdentifier: "Register1Controller") as! Register1Controller
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateRegister1Controller = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerRegister2: Register2Controller =
    {
        var controllerChild = storyboardRegister.instantiateViewController(withIdentifier: "Register2Controller") as! Register2Controller
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateRegister2Controller = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerRegister3: Register3Controller =
    {
        var controllerChild = storyboardRegister.instantiateViewController(withIdentifier: "Register3Controller") as! Register3Controller
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateRegister3Controller = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerRegister4: Register4Controller =
    {
        var controllerChild = storyboardRegister.instantiateViewController(withIdentifier: "Register4Controller") as! Register4Controller
        controllerChild.view.frame = viewContainerMain.bounds
        controllerChild.delegateRegister4Controller = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let controllerRegister = segue.destination as? Register1Controller,
            segue.identifier == "Register1ID"
        {
            controllerRegister.delegateRegister1Controller = self
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
        
        updateProgressBarSection(controllerParent: self, stackViewProgressBarSection: controllerHeaderControl.stackViewProgressBarSection, viewProgressBarSectionComplete: controllerHeaderControl.viewProgressBarSectionComplete, viewProgressBarSectionNotComplete: controllerHeaderControl.viewProgressBarSectionNotComplete, intComplete: section, intTotal: REGISTER_SECTION_TOTAL)
    }
    
    public func goToLogin()
    {
        delegateRegisterController?.GoToPage(Controller: "Login")
    }
    
    public func goToRegister1()
    {
        self.childChangeController(viewController: controllerRegister1, section: 1)
    }
    
    public func goToRegister2()
    {
        self.childChangeController(viewController: controllerRegister2, section: 2)
    }
    
    public func goToRegister3()
    {
        self.childChangeController(viewController: controllerRegister3, section: 3)
    }
    
    public func goToRegister4()
    {
        self.childChangeController(viewController: controllerRegister4, section: 4)
    }
}
// MARK: NAVIGATION DELEGATE

    
extension RegisterMainController
{
    func goToPrevious()
    {
        if (controllerChildCurrent == controllerRegister1)
        {
            goToLogin()
        }
        else if (controllerChildCurrent == controllerRegister2)
        {
            goToRegister1()
        }
        else if (controllerChildCurrent == controllerRegister3)
        {
            goToRegister2()
        }
        else if (controllerChildCurrent == controllerRegister4)
        {
            goToRegister3()
        }
        else
        {
            goToLogin()
        }
    }
    
    func goToNext() {
        if (controllerChildCurrent == controllerRegister1)
        {
            goToRegister2()
        }
        else if (controllerChildCurrent == controllerRegister2)
        {
            goToRegister3()
        }
        else if (controllerChildCurrent == controllerRegister3)
        {
            goToRegister4()
        }
        else if (controllerChildCurrent == controllerRegister4)
        {
            goToLogin()
        }
        else
        {
            goToLogin()
        }
    }
}
