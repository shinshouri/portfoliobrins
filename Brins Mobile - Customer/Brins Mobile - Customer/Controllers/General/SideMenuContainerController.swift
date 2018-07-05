//
//  SideMenuContainerController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 22/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

class SideMenuContainerController: UIViewController,
    SideMenuControllerDelegate,
    LoginControllerDelegate,
    RegisterControllerDelegate,
    ForgotPasswordControllerDelegate,
    ProductListControllerDelegate,
    ProductAsriMainControllerDelegate,
    ProductOtoMainControllerDelegate,
    ProfileControllerDelegate,
    ChangePasswordControllerDelegate,
    ChangePhoneNumberControllerDelegate,
    ChangeEmailControllerDelegate,
    FAQControllerDelegate,
    AboutControllerDelegate
{
    @IBOutlet var controllerHeaderMain: HeaderMainController!
    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewSideMenu: UIView!
    @IBOutlet weak var toggleSideMenu: NSLayoutConstraint!
    
    var controllerChildCurrent: UIViewController!
    var controllerChildPrevious: UIViewController!
    var coverView: UIView!
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.toggleSideMenu.constant = self.view.frame.size.width*(-0.8)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(CloseSideMenu(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        // Do any additional setup after loading the view.
        controllerHeaderMain.labelTitle.text = L("")
        controllerHeaderMain.buttonNavigation.tag = 5
        controllerHeaderMain.buttonNavigation.addTarget(self, action: #selector(Act(_:)), for: .touchUpInside)
        
        controllerChildCurrent = controllerProductList
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: CONTROLLER DECLARATION
    
    private lazy var controllerProductList: ProductListController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductList") as! ProductListController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateProductListController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerRegister: RegisterMainController =
    {
        var controllerChild = UIStoryboard(name: "RegisterStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Register") as! RegisterMainController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateRegisterController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerLogin: LoginController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Login") as! LoginController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateLoginController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerForgotPassword: ForgotPasswordController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateForgotPasswordController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerProfile: ProfileController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "Profile") as! ProfileController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateProfileController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerChangePassword: ChangePasswordController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePassword") as! ChangePasswordController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateChangePasswordController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerChangePhoneNumber: ChangePhoneNumberController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePhoneNumber") as! ChangePhoneNumberController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateChangePhoneNumberController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerChangeEmail: ChangeEmailController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangeEmail") as! ChangeEmailController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateChangeEmailController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerFAQ: FAQController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "FAQ") as! FAQController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateFAQController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerAbout: AboutController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "About") as! AboutController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateAboutController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerProductAsriMain: ProductAsriMainController =
    {
        var controllerChild = UIStoryboard(name: "ProductAsriStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductAsriMain") as! ProductAsriMainController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateProductAsriMainController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerProductOtoMain: ProductOtoMainController =
    {
        var controllerChild = UIStoryboard(name: "ProductOtoStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductOtoMain") as! ProductOtoMainController
        controllerChild.view.frame = viewMain.bounds
        controllerChild.delegateProductOtoMainController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    private lazy var controllerSideMenu: SideMenuController =
    {
        var controllerChild = UIStoryboard(name: "MainStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SideMenu") as! SideMenuController
        controllerChild.view.frame = viewSideMenu.bounds
        controllerChild.delegateSideMenuController = self
        self.addChildViewController(controllerChild)
        
        return controllerChild
    }()
    
    @objc func Act(_ sender:UIButton) -> Void
    {
        if(sender.tag == 5)
        {
            self.ShowSideMenu()
        }
    }
    
    func ShowSideMenu()
    {
        removeControllerChild(controllerChild: controllerSideMenu)
        self.viewSideMenu.addSubview(controllerSideMenu.view)
        controllerSideMenu.didMove(toParentViewController: self)
        if (toggleSideMenu.constant == 0)
        {
            self.CloseSideMenu(self.view)
        }
        else
        {
            self.OpenSideMenu(self.view)
        }
    }
    
    func GoToPage(Controller: String) {
        switch Controller {
        case "Register":
            controllerHeaderMain.labelTitle.text = L("PAGE_REGISTRATION")
            childChangeController(viewController: controllerRegister)
            break
        case "Login":
            controllerHeaderMain.labelTitle.text = L("PAGE_LOGIN")
            childChangeController(viewController: controllerLogin)
            break
        case "ForgotPassword":
            controllerHeaderMain.labelTitle.text = L("PAGE_CHANGEPASSWORD")
            childChangeController(viewController: controllerForgotPassword)
            break
        case "ProductList":
            controllerHeaderMain.labelTitle.text = L("PAGE_BUYPRODUCT")
            childChangeController(viewController: controllerProductList)
            break
        case "Profile":
            controllerHeaderMain.labelTitle.text = L("PAGE_PROFILE")
            childChangeController(viewController: controllerProfile)
            break
        case "ChangePassword":
            controllerHeaderMain.labelTitle.text = L("PAGE_CHANGEPASSWORD")
            childChangeController(viewController: controllerChangePassword)
            break
        case "ChangePhoneNumber":
            controllerHeaderMain.labelTitle.text = L("PAGE_CHANGEMOBILEPHONE")
            childChangeController(viewController: controllerChangePhoneNumber)
            break
        case "ChangeEmail":
            controllerHeaderMain.labelTitle.text = L("PAGE_CHANGEEMAIL")
            childChangeController(viewController: controllerChangeEmail)
            break
        case "FAQ":
            controllerHeaderMain.labelTitle.text = L("PAGE_FAQ")
            childChangeController(viewController: controllerFAQ)
            break
        case "About":
            controllerHeaderMain.labelTitle.text = L("PAGE_ABOUTUS")
            childChangeController(viewController: controllerAbout)
            break
        case "ProductAsriMain":
            controllerHeaderMain.labelTitle.text = L("PAGE_PRODUCTASRI")
            childChangeController(viewController: controllerProductAsriMain)
            break
        case "ProductOtoMain":
            controllerHeaderMain.labelTitle.text = L("PAGE_PRODUCTOTO")
            childChangeController(viewController: controllerProductOtoMain)
            break
        default:
            break
        }
    }
    
    func GoToStoryBoard(StoryboardName: String, StoryboardID: String) {
        moveStoryboard(sender: self, StoryboardName: StoryboardName, StoryboardID: StoryboardID)
    }
    
    @objc func OpenSideMenu(_ sender:UIView) -> Void
    {
        coverView = UIView(frame: CGRect(x: self.view.frame.size.width*(0.8), y: 0, width: self.view.frame.size.width*(0.2), height: self.view.frame.size.height))
        coverView.backgroundColor = UIColor.clear
        coverView.addGestureRecognizer(tapGesture)
        self.view.addSubview(coverView)
        UIView.animate(withDuration: 0.5, animations:{() -> Void in
            self.toggleSideMenu.constant = 0
            self.view.layoutIfNeeded()})
    }
    
    @objc func CloseSideMenu(_ sender:UIView) -> Void
    {
        coverView.removeFromSuperview()
        UIView.animate(withDuration: 0.5, animations:{() -> Void in
            self.toggleSideMenu.constant = self.view.frame.size.width*(-0.8)
            self.view.layoutIfNeeded()})
    }
    
    private func childChangeController(viewController:UIViewController)
    {
        controllerChildPrevious = controllerChildCurrent
        removeControllerChild(controllerChild: controllerChildCurrent)
        self.viewMain.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
        controllerChildCurrent = viewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let controllerSideMenu = segue.destination as? SideMenuController,
            segue.identifier == "SideMenuID"
        {
            controllerSideMenu.delegateSideMenuController = self
        }
        else if let controllerLogin = segue.destination as? LoginController,
            segue.identifier == "LoginID"
        {
            controllerLogin.delegateLoginController = self
        }
        else if let controllerRegister = segue.destination as? RegisterMainController,
            segue.identifier == "RegisterID"
        {
            controllerRegister.delegateRegisterController = self
        }
        else if let controllerForgotPassword = segue.destination as? ForgotPasswordController,
            segue.identifier == "ForgotPasswordID"
        {
            controllerForgotPassword.delegateForgotPasswordController = self
        }
        else if let controllerProductList = segue.destination as? ProductListController,
            segue.identifier == "ProductListID"
        {
            controllerProductList.delegateProductListController = self
        }
        else if let controllerProductAsriMain = segue.destination as? ProductAsriMainController,
            segue.identifier == "ProductAsriMainID"
        {
            controllerProductAsriMain.delegateProductAsriMainController = self
        }
        else if let controllerProductOtoMain = segue.destination as? ProductOtoMainController,
            segue.identifier == "ProductOtoMainID"
        {
            controllerProductOtoMain.delegateProductOtoMainController = self
        }
        else if let controllerProfile = segue.destination as? ProfileController,
            segue.identifier == "ProfileID"
        {
            controllerProfile.delegateProfileController = self
        }
        else if let controllerChangePassword = segue.destination as? ChangePasswordController,
            segue.identifier == "ChangePasswordID"
        {
            controllerChangePassword.delegateChangePasswordController = self
        }
        else if let controllerChangePhoneNumber = segue.destination as? ChangePhoneNumberController,
            segue.identifier == "ChangePhoneNumberID"
        {
            controllerChangePhoneNumber.delegateChangePhoneNumberController = self
        }
        else if let controllerChangeEmail = segue.destination as? ChangeEmailController,
            segue.identifier == "ChangeEmailID"
        {
            controllerChangeEmail.delegateChangeEmailController = self
        }
        else if let controllerFAQ = segue.destination as? FAQController,
            segue.identifier == "FAQID"
        {
            controllerFAQ.delegateFAQController = self
        }
        else if let controllerAbout = segue.destination as? AboutController,
            segue.identifier == "AboutID"
        {
            controllerAbout.delegateAboutController = self
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
