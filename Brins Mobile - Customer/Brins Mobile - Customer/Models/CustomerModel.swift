//
//  CustomerModel.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit


protocol CustomerModelProtocol {
//    var age: Int { get }
//    func agetype() -> String
}

class CustomerModel {
    var PostalCode: String
    var UpdatedOn: String
    var EmailToken: String
    var EmailState: String
    var Sex: String
    var Password: String
    var Name: String
    var CreatedBy: String
    var Address: String
    var Culture: String
    var Birthday: String
    var State: String
    var MobilePhoneState: String
    var PasswordNew: String
    var BranchCode: String
    var MobilePhoneToken: String
    var Email: String
    var IdentificationName: String
    var UpdatedBy: String
    var MobilePhone: String
    var CustomerID: String
    var ID: String
    var IdentificationNumber: String
    var LastLoginOn: String
    var IdentificationType: String
    var Telephone: String
    var DeviceID: String
    
    init(dict: NSDictionary) {
        self.PostalCode = dict.object(forKey: "PostalCode") as! String
        self.UpdatedOn = dict.object(forKey: "UpdatedOn") as! String
        self.EmailToken = dict.object(forKey: "EmailToken") as! String
        self.EmailState = dict.object(forKey: "EmailState") as! String
        self.Sex = dict.object(forKey: "Sex") as! String
        self.Password = dict.object(forKey: "Password") as! String
        self.Name = dict.object(forKey: "Name") as! String
        self.CreatedBy = dict.object(forKey: "CreatedBy") as! String
        self.Address = dict.object(forKey: "Address") as! String
        self.Culture = dict.object(forKey: "Culture") as! String
        self.Birthday = dict.object(forKey: "Birthday") as! String
        self.State = dict.object(forKey: "State") as! String
        self.MobilePhoneState = dict.object(forKey: "MobilePhoneState") as! String
        self.PasswordNew = dict.object(forKey: "PasswordNew") as! String
        self.BranchCode = dict.object(forKey: "BranchCode") as! String
        self.MobilePhoneToken = dict.object(forKey: "MobilePhoneToken") as! String
        self.Email = dict.object(forKey: "Email") as! String
        self.IdentificationName = dict.object(forKey: "IdentificationName") as! String
        self.UpdatedBy = dict.object(forKey: "UpdatedBy") as! String
        self.MobilePhone = dict.object(forKey: "MobilePhone") as! String
        self.CustomerID = dict.object(forKey: "CustomerID") as! String
        self.ID = dict.object(forKey: "ID") as! String
        self.IdentificationNumber = dict.object(forKey: "IdentificationNumber") as! String
        self.LastLoginOn = dict.object(forKey: "LastLoginOn") as! String
        self.IdentificationType = dict.object(forKey: "IdentificationType") as! String
        self.Telephone = dict.object(forKey: "Telephone") as! String
        self.DeviceID = dict.object(forKey: "DeviceID") as! String
    }
}

extension CustomerModel : CustomerModelProtocol {
    
    func GetAllData() -> NSDictionary {
        return ["PostalCode" : PostalCode,
                "UpdatedOn" : UpdatedOn,
                "EmailToken" : EmailToken,
                "EmailState" : EmailState,
                "Sex" : Sex,
                "Password" : Password,
                "Name" : Name,
                "CreatedBy" : CreatedBy,
                "Address" : Address,
                "Culture" : Culture,
                "Birthday" : Birthday,
                "State" : State,
                "MobilePhoneState" : MobilePhoneState,
                "PasswordNew" : PasswordNew,
                "BranchCode" : BranchCode,
                "MobilePhoneToken" : MobilePhoneToken,
                "Email" : Email,
                "IdentificationName" : IdentificationName,
                "UpdatedBy" : UpdatedBy,
                "MobilePhone" : MobilePhone,
                "CustomerID" : CustomerID,
                "ID" : ID,
                "IdentificationNumber" : IdentificationNumber,
                "LastLoginOn" : LastLoginOn,
                "IdentificationType" : IdentificationType,
                "Telephone" : Telephone,
                "DeviceID" : DeviceID,]
    }
}
