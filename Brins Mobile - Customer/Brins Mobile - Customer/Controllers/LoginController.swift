//
//  ViewController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

//MARK: IMPORT
import UIKit


//MARK: PROTOCOL
protocol LoginControllerDelegate
{
    func GoToPage(Controller:String)
    func ShowSideMenu()
}

class LoginController: ParentViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var SlideLogin: NSLayoutConstraint!
    
    var delegateLoginController: LoginControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        productAsriModel = ProductAsriModel.init(dict: MyVariables.ModelCustomer)
//        NSLog("%@", productAsriModel.GetAllData())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBACTION
    @IBAction func ActionLogin(sender: UIButton)
    {
//        if ((self.userName.text?.count)! > 0 && (self.password.text?.count)! > 0)
//        {
            RequestAPILogin()
//        }
//        else
//        {
//            present(ShowAlertViewController(sender: self, title: "Message", message: "Harap isi nomor handphone dan password"), animated: true, completion: nil)
//        }
        
//        self.defaults.set("Y", forKey: "StatusLogin")
//        delegateLoginController?.GoToPage(Controller: "ProductList")
    }
    
    @IBAction func ActionLoginAgent(sender: UIButton)
    {
        //        if ((self.userName.text?.count)! > 0 && (self.password.text?.count)! > 0)
        //        {
        //            RequestAPILogin()
        //        }
        //        else
        //        {
        //            present(ShowAlertViewController(sender: self, title: "Message", message: "Harap isi nomor handphone dan password"), animated: true, completion: nil)
        //        }
    }
    
    @IBAction func ActionRegister(sender: UIButton)
    {
        delegateLoginController?.GoToPage(Controller: "Register")
    }
    
    @IBAction func ActionCustomer(sender: UIButton)
    {
        UIView.animate(withDuration: 0.5, animations:{() -> Void in
            self.SlideLogin.constant = 0
            self.view.layoutIfNeeded()})
    }
    
    @IBAction func ActionAgent(sender: UIButton)
    {
        UIView.animate(withDuration: 0.5, animations:{() -> Void in
            self.SlideLogin.constant = self.view.frame.size.width*(-1)
            self.view.layoutIfNeeded()})
    }
    
    
    //MARK: REQUEST API
    func RequestAPILogin() -> Void
    {
        showLoading()
//        let strparams = ["MobilePhone": self.userName.text!, "Password" : self.password.text!]
        let strparams = ["MobilePhone": "1234567890", "Password" : "123456"]
        DispatchQueue.global(qos: .default).async
        {
//            self.response = self.RequestAPI(urlRequest: WEBSERVICE_SERVER_CUSTOMER_CHECKLOGIN, params: strparams)
            self.response = self.RequestEncrypt(urlRequest: "", params: strparams)
            self.response = self.RequestAPI(urlRequest: "https://brinsmobdev.brins.co.id/TrainingService/checkLoginString", params: strparams)
            NSLog("%@", self.response!)
            DispatchQueue.main.async
            {
                self.loading?.removeFromSuperview()
                if (self.response == nil)
                {
                    self.present(ShowAlertViewController(sender: self, title: "Message", message: "Periksa Koneksi Internet Anda"), animated: true, completion: nil)
                }
                else if (self.response?.object(forKey: "HTMLResponseCode") as? String == "0")
                {
                    let alertController = UIAlertController(title: (self.response?.object(forKey: "MessageTitle") as! String), message: "Login Berhasil", preferredStyle: .alert)
                    
                    let button = UIAlertAction(title:"OK", style: .default, handler: { (action) -> Void in
                        self.defaults.set("Y", forKey: "StatusLogin")
                        self.delegateLoginController?.GoToPage(Controller: "ProductList")
                    })
                    alertController.addAction(button)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                else
                {
                    self.present(ShowAlertViewController(sender: self, title: self.response?.object(forKey: "MessageTitle") as! String, message: self.response?.object(forKey: "MessageContent") as! String), animated: true, completion: nil)
                }
            }
        }
    }
}

