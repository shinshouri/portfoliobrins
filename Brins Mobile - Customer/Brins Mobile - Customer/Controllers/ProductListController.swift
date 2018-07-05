//
//  ProductListController.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//


// MARK: IMPORT

import Foundation
import UIKit

// MARK: PROTOCOL

protocol ProductListControllerDelegate
{
    func GoToPage(Controller:String)
    func ShowSideMenu()
}


// MARK: CONTROLLER

class ProductListController: ParentViewController, UITableViewDelegate, UITableViewDataSource
{
    // MARK: USER INTERFACE COMPONENT
    
    @IBOutlet var controllerHeaderThick: HeaderThickController!;
    @IBOutlet weak var tableView: UITableView!
    
    var delegateProductListController: ProductListControllerDelegate?
    var listProductImg, listProductTitle, listProductDetail: NSMutableArray!
    // MARK: VIEW DID LOAD
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        controllerHeaderThick.labelTitle.text = L("PAGE_BUYPRODUCT")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = UIColor.clear
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        listProductImg = ["icon_product_asri","icon_product_oto"]
        listProductTitle = ["BRINS ASRI", "BRINS OTO"]
        listProductDetail = ["Asuransi Rumah Tinggal Plus, memberikan perlindungan terhadap rumah tinggal, penghuni, serta tanggung jawab kepada pihak ketiga, dengan 3 Varian Paket : Platinum, Gold & Silver", "Asuransi Mobil Plus, memberikan ganti rugi kepada Tertanggung atas kerugian total dan atau kerusakan sebagian dengan 4 pilihan paket : Platinum, Gold, Silver & Bronze"]
        
//        productAsriModel =  ProductAsriModel.init(dict: ["FirstName":"First", "LastName":"Last"])
//        MyVariables.ModelCustomer = productAsriModel.GetAllData()
//        NSLog("%@", productAsriModel.GetAllData().object(forKey: "FirstName") as! String)
        
        let strparams = ["MobilePhone": "1234567890", "Password" : "123456"]
        let jsonParams = try? JSONSerialization.data(withJSONObject: strparams, options: [])
        let paramsString = String(data: jsonParams!, encoding: .utf8)
        
        let addparams: Dictionary<String,Any> = ["Data": paramsString!]
        let dtparamsBody = try? JSONSerialization.data(withJSONObject: addparams, options: [])
        
        let decresponse = self.Base64Decoded(data: "eyJEYXRhIjoiZlFuM3VQYTZRVWEvTC9kVnpFeU1YNWtzYWZxcElHck1YbFpNaVdRaXZ0TklRTXl3em05ZGYxdHlZS3BKZUkzMiIsIktleSI6IkMzVlVaR0ZSWldYSENHRSJ9")
        let encresponse = self.Base64Encoded(data: decresponse)
        
        let asddsa = self.myEncrypt(string: String(data: dtparamsBody!, encoding: .utf8)!, keyString:STRING_SERVER_KEY_RESPONSE_PRIVATE)
//        let dsaasd =  self.myDecrypt(decryptData: asddsa!, keyData: STRING_SERVER_KEY_REQUEST_PRIVATE)
//        let dec = String(data: dsaasd! as Data, encoding: .utf8)
    }
    
    
    // MARK: DID RECEIVE MEMORY WARNING
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func Act(_ sender:UIButton) -> Void
    {
        if(sender.tag == 1)
        {
            delegateProductListController?.GoToPage(Controller: "ProductAsriMain")
        }
        else if(sender.tag == 2)
        {
            delegateProductListController?.GoToPage(Controller: "ProductOtoMain")
        }
    }
    
    //MARK: Tableview Controller Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProductImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:TableViewCellProductList = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCellProductList
        
        // set the text from the data model
        cell.imageProduct.image = UIImage(named: (listProductImg.object(at: indexPath.row) as? String)!)
        cell.imageProduct.backgroundColor = generatorUIColor(intHexColor: THEME_GENERAL_QUINARY, doubleOpacity: 1.0)
        cell.imageProduct.layer.cornerRadius = 50
        cell.titleProduct.text = listProductTitle.object(at: indexPath.row) as? String
        cell.descProduct.text = listProductDetail.object(at: indexPath.row) as? String
        cell.buttonProduct.setTitle("Pilih", for: .normal)
        cell.buttonProduct.addTarget(self, action: #selector(Act(_:)), for: .touchUpInside)
        cell.buttonProduct.tag = indexPath.row+1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.row {
        case 0:
            delegateProductListController?.GoToPage(Controller: "ProductAsriMain")
            break
        case 1:
            delegateProductListController?.GoToPage(Controller: "ProductOtoMain")
            break
        default:
            break
        }
        print("You tapped cell number \(indexPath.row).")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 140
//    }
}
