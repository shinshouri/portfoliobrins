//
//  ProductOtoInformation.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 17/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

// MARK: IMPORT

import Foundation
import UIKit


// MARK: DELEGATE

protocol ProductOtoVehicleInformationControllerDelegate
{
    func goToPrevious()
    func goToNext()
}


// MARK: CONTROLLER

class ProductOtoVehicleInformationController: ParentViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    // MARK: USER INTERFACE COMPONENT
    @IBOutlet var controllerHeaderForm: HeaderFormController!
    
    @IBOutlet weak var VehicleBrand: UITextField!
    var delegateProductOtoVehicleInformationController: ProductOtoVehicleInformationControllerDelegate?
    var dataPicker: NSMutableArray?
    
    
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controllerHeaderForm.labelTitle.text = L("HEADER_FORM_VEHICLEINFORMATION")
        
        TextfieldChangeEnabled(sender: VehicleBrand, state: false)
        
        dataPicker = ["1", "2", "3"]
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: DELEGATE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (dataPicker?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return (dataPicker?.object(at: row) as! String)
        } else {
            return "Second \(row)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        VehicleBrand.text = (dataPicker?.object(at: row) as! String)
        self.picker?.removeFromSuperview()
    }
    
    
    // MARK: ACTION
    
    @IBAction func goToNext(sender: UIButton)
    {
        delegateProductOtoVehicleInformationController?.goToNext()
    }
    
    @IBAction func ActionMerkKendaraan(sender: UIButton)
    {
        self.view.addSubview(showPicker(sender: self, tag: 1))
        
//        let alertController = ShowAlertSheetViewController(sender: self, title: "", message: "What would you like to do?")
//
//        for i in 0..<20
//        {
//            let sendButton = UIAlertAction(title:String(format: "%@%i", "Send now", i), style: .default, handler: { (action) -> Void in
//                self.textfield1.text = String(format: "%@%i", "Send now", i)
//            })
//            alertController.addAction(sendButton)
//        }
//
//        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func ActionModelKendaraan(sender: UIButton)
    {
        self.view.addSubview(showPicker(sender: self, tag: 2))
    }
    
    @IBAction func ActionNomorPolisi(sender: UIButton)
    {
        
    }
    
    @IBAction func ActionTahunKendaraan(sender: UIButton)
    {
        
    }
    
    @IBAction func ActionWilayahPenggunaanKendaraan(sender: UIButton)
    {
        
    }
}
