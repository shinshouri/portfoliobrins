//
//  ProductAsriModel.swift
//  Brins Mobile - Customer
//
//  Created by Ibrahim Aziz Tejokusumo on 13/04/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit


protocol ProductAsriModelProtocol {
//    var age: Int { get }
//    func agetype() -> String
}

class ProductAsriModel {
    var firstname: String
    var lastname: String
    
    init(dict: NSDictionary) {
        self.firstname = dict.object(forKey: "FirstName") as! String
        self.lastname = dict.object(forKey: "LastName") as! String
    }
}

extension ProductAsriModel : ProductAsriModelProtocol {
    
    func GetAllData() -> NSDictionary {
        return ["FirstName" : firstname, "LastName" : lastname]
    }
    
//    func agetype() -> String {
//        switch age {
//        case 0...2:
//            return "Baby"
//        case 2...12:
//            return "Child"
//        case 13...19:
//            return "Teenager"
//        case let x where x > 65:
//            return "Elderly"
//        default:
//            return "Normal"
//        }
//    }
}
