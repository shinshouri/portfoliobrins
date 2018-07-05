//
//  ProfileController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 06/06/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit

protocol ProfileControllerDelegate
{
    func ShowSideMenu()
}

class ProfileController: UIViewController {

    @IBOutlet var controllerHeaderForm: HeaderFormController!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var IDNumber: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var Gender: UISegmentedControl!
    @IBOutlet weak var BirthDate: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Branch: UITextField!
    
    var delegateProfileController: ProfileControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_PERSONALINFORMATION")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ActionChangeProfile(sender: UIButton)
    {
        
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
