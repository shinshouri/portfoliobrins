//
//  SideMenuController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 22/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

//MARK: IMPORT

import Foundation
import UIKit


// MARK: PROTOCOL

protocol SideMenuControllerDelegate
{
    func GoToPage(Controller:String)
    func GoToStoryBoard(StoryboardName:String, StoryboardID:String)
    func ShowSideMenu()
}


// MARK: CONTROLLER

class SideMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    var delegateSideMenuController: SideMenuControllerDelegate?
    let defaults: UserDefaults! = UserDefaults.standard
    var listSideMenu: NSMutableArray!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SECONDARY, doubleOpacity: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if (defaults.string(forKey: "StatusLogin") ?? "") == "N"
        {
            listSideMenu = [L("PAGE_BUYPRODUCT") , L("PAGE_FAQ"), L("PAGE_ABOUTUS")]
        }
        else
        {
            listSideMenu = [L("PAGE_BUYPRODUCT"), L("PAGE_PRODUCTSUBMITTEDLIST"), L("PAGE_CLAIMAPPLY"), L("PAGE_CLAIMSUBMITTEDLIST"), L("PAGE_PROFILE"), L("PAGE_CHANGEPASSWORD"), L("PAGE_CHANGEMOBILEPHONE"), L("PAGE_CHANGEEMAIL"), L("PAGE_FAQ"), L("PAGE_ABOUTUS"), L("Logout")]
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Tableview Controller Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSideMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        // set the text from the data model
        cell.textLabel?.text = listSideMenu.object(at: indexPath.row) as? String
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: FONT_SLIDE_CONTENT)
        cell.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_SECONDARY, doubleOpacity: 1.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (defaults.string(forKey: "StatusLogin") ?? "") == "N"
        {
            switch indexPath.row {
            case 0:
                delegateSideMenuController?.GoToPage(Controller: "ProductList")
                break
            case 1:
                delegateSideMenuController?.GoToPage(Controller: "FAQ")
                break
            case 2:
                delegateSideMenuController?.GoToPage(Controller: "About")
                break
            default:
                break
            }
        }
        else
        {
            switch indexPath.row {
            case 0:
                delegateSideMenuController?.GoToPage(Controller: "ProductList")
                break
            case 1:
                
                break
            case 2:
                
                break
            case 3:
                
                break
            case 4:
                delegateSideMenuController?.GoToPage(Controller: "Profile")
                break
            case 5:
                delegateSideMenuController?.GoToPage(Controller: "ChangePassword")
                break
            case 6:
                delegateSideMenuController?.GoToPage(Controller: "ChangePhoneNumber")
                break
            case 7:
                delegateSideMenuController?.GoToPage(Controller: "ChangeEmail")
                break
            case 8:
                delegateSideMenuController?.GoToPage(Controller: "FAQ")
                break
            case 9:
                delegateSideMenuController?.GoToPage(Controller: "About")
                break
            case 10:
                let alertController = ShowAlertViewController(sender: self, title: "Log out", message: "Apakah anda yakin akan log out dari sesi anda ?.")
                
                let sendButton = UIAlertAction(title:"Ya", style: .default, handler: { (action) -> Void in
                    self.defaults.set("N", forKey: "StatusLogin")
                    self.delegateSideMenuController?.GoToPage(Controller: "ProductList")
                })
                alertController.addAction(sendButton)
                
                present(alertController, animated: true, completion: nil)
                break
            default:
                break
            }
        }
        
        delegateSideMenuController?.ShowSideMenu()
    }
    
    @IBAction func ActionLogin(sender: UIButton)
    {
        if (defaults.string(forKey: "StatusLogin") ?? "") == "N"
        {
            delegateSideMenuController?.GoToPage(Controller: "Login")
            delegateSideMenuController?.ShowSideMenu()
        } else
        {
            let alertController = ShowAlertViewController(sender: self, title: "Log out", message: "Apakah anda yakin akan log out dari sesi anda ?.")
            
            let sendButton = UIAlertAction(title:"Ya", style: .default, handler: { (action) -> Void in
                    self.defaults.set("N", forKey: "StatusLogin")
                    self.delegateSideMenuController?.GoToPage(Controller: "ProductList")
                    self.delegateSideMenuController?.ShowSideMenu()
                })
            alertController.addAction(sendButton)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func ActionClose(sender: UIButton)
    {
        delegateSideMenuController?.ShowSideMenu()
    }
}
