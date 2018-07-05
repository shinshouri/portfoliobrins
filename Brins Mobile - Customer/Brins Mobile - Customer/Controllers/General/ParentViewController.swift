//
//  ParentViewController.swift
//  Brins Mobile - Customer
//
//  Created by Michael C on 31/05/18.
//  Copyright © 2018 InfoConnect Sdn. Bhd. All rights reserved.
//

import UIKit
import JavaScriptCore

struct MyVariables {
    static var ModelCustomer : NSDictionary = [:]
}

class ParentViewController: UIViewController {

    var response: NSDictionary?
    var loading: UIView?
    var defaults: UserDefaults! = UserDefaults.standard
    var customerModel: CustomerModel!
    var productAsriModel: ProductAsriModel!
    var picker: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: PROCEDURE
    func showLoading() -> Void
    {
        loading?.removeFromSuperview()
        loading = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        loading?.backgroundColor = generatorUIColor(intHexColor: THEME_FONT_PRIMARY, doubleOpacity: 0.5)
        
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle:.whiteLarge)
        ai.startAnimating()
        ai.center = (loading?.center)!
        
        loading?.addSubview(ai)
        self.view.addSubview(loading!)
    }
    
    func showPicker(sender:UIViewController, tag:Int) -> UIPickerView {
        picker = UIPickerView(frame: CGRect(x: 0, y: self.view.frame.size.height-(self.view.frame.size.height/3), width: self.view.frame.size.width, height: self.view.frame.size.height/3))
        picker?.delegate = (sender as! UIPickerViewDelegate)
        picker?.dataSource = (sender as! UIPickerViewDataSource)
        picker?.backgroundColor = UIColor.gray
        picker?.tag = tag
        
        return picker!
    }
    
    
    //MARK: FUNCTION
    func strToDict(str: String) -> NSDictionary
    {
        let data = str.data(using: String.Encoding.utf8)
        
        return try! JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
    }
    
    func Base64Encoded(data:NSData) -> String {
        let Base64Data = data.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
        
        return String(data: Base64Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    }
    
    func Base64Decoded(data:String) -> NSData {
        return NSData(base64Encoded: data, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
    }
    
    func RequestAPI(urlRequest:String, params:[String:Any]) -> NSDictionary
    {
        response = nil
        var result : NSDictionary = [:]
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.global(qos: .background).async
        {
            guard let todosURL = URL(string: urlRequest)
            else
            {
                print("Error: cannot create URL")
                return
            }
            let todosUrlRequest = NSMutableURLRequest(url:todosURL)
            todosUrlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            todosUrlRequest.httpMethod = "POST"
            todosUrlRequest.timeoutInterval = 300
            
            let jsonParams = try? JSONSerialization.data(withJSONObject: params, options: [])
//            let paramsString = String(data: jsonParams!, encoding: .utf8)
//
//            let addparams: Dictionary<String,Any> = ["ID":"1", "UserID":"A", "DeviceID":"123", "Culture":"id-ID", "IPAddress":"121.144","Data": paramsString!]
//            let dtparamsBody = try? JSONSerialization.data(withJSONObject: addparams, options: [])
            
            let encbody = self.Base64Encoded(data: jsonParams! as NSData)
            let encparams: Dictionary<String,Any> = ["Data": params, "Key":STRING_SERVER_KEY_REQUEST_PUBLIC]
            let dtparamsb64 = try? JSONSerialization.data(withJSONObject: encparams, options: [])
            
//            let dtparams = self.Base64Encoded(data: dtparamsenc! as NSData)
            
            do
            {
//                todosUrlRequest.httpBody = dtparamsb64?.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
                todosUrlRequest.httpBody = dtparamsb64
            }
            catch
            {
                print("Error: cannot create JSON from todo")
                return
            }
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: todosUrlRequest as URLRequest)
            {
                (data, responses, error) in
                guard error == nil
                    else
                {
                    print(error.debugDescription)
                    return
                }
                guard let responseData = data
                    else
                {
                    print("Error: did not receive data")
                    return
                }
                
                // parse the result as JSON, since that's what the API provides
                do
                {
//                    guard let receivedData = try JSONSerialization.jsonObject(with: responseData, options: .mutableLeaves) as? NSDictionary
//                    else
//                    {
//                        print("Could not get JSON from responseData as dictionary")
//                        return
//                    }
                    
//                    let decresponse = self.Base64Decoded(data: String(data: responseData, encoding: .utf8)!)
                    let decresponse = self.Base64Decoded(data: "eyJEYXRhIjoiZlFuM3VQYTZRVWEvTC9kVnpFeU1YNWtzYWZxcElHck1YbFpNaVdRaXZ0TklRTXl3em05ZGYxdHlZS3BKZUkzMiIsIktleSI6IkMzVlVaR0ZSWldYSENHRSJ9")
                    
                    let dtresponse = try JSONSerialization.jsonObject(with: decresponse as Data, options: .mutableLeaves) as? NSDictionary
                    
                    if((dtresponse?.object(forKey: "Key") as? String)! == STRING_SERVER_KEY_RESPONSE_PUBLIC)
                    {
//                        let decryptResponse = self.Base64Decoded(data: (dtresponse?.object(forKey: "Data") as? String)!)
                        let decryptResponse = self.Base64Decoded(data: "eyJEYXRhIjoiZlFuM3VQYTZRVWEvTC9kVnpFeU1YNWtzYWZxcElHck1YbFpNaVdRaXZ0TklRTXl3em05ZGYxdHlZS3BKZUkzMiIsIktleSI6IkMzVlVaR0ZSWldYSENHRSJ9")
                        let dataresult = try JSONSerialization.jsonObject(with: decryptResponse as Data, options: .mutableLeaves) as? NSDictionary
                        
                        result = dataresult!
//                        result = receivedData as NSDictionary
                    }
                    else
                    {
                        result = ["MessageTitle" : "", "MessageContent" : "Invalid Request"]
                    }
                    
                    
                    group.leave()
                }
                catch
                {
                    result = ["MessageTitle" : "", "MessageContent" : error.localizedDescription]
                    group.leave()
                    return
                }
            }
            task.resume()
        }
        group.wait()
        
        return result
    }
    
    func RequestEncrypt(urlRequest:String, params:[String:Any]) -> NSDictionary
    {
        response = nil
        var result : NSDictionary = [:]
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.global(qos: .background).async
            {
                guard let todosURL = URL(string: "https://brinsmobdev.brins.co.id/EncryptService/EncryptData")
                    else
                {
                    print("Error: cannot create URL")
                    return
                }
                let todosUrlRequest = NSMutableURLRequest(url:todosURL)
                todosUrlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                todosUrlRequest.httpMethod = "POST"
                todosUrlRequest.timeoutInterval = 300
                
                let jsonParams = try? JSONSerialization.data(withJSONObject: params, options: [])
                let paramsString = String(data: jsonParams!, encoding: .utf8)
                
                let addparams: Dictionary<String,Any> = ["ID":"1", "UserID":"A", "DeviceID":"123", "Culture":"id-ID", "IPAddress":"121.144","Data": paramsString!]
                let dtparamsBody = try? JSONSerialization.data(withJSONObject: addparams, options: [])
                
                let dtparamsBodyString = String(data: dtparamsBody!, encoding: .utf8)
                
                let encbody = self.Base64Encoded(data: dtparamsBody! as NSData)
                let decbody = self.Base64Decoded(data: encbody)
                //            let dtparams = self.Base64Encoded(data: dtparamsenc! as NSData)
                
//                do
//                {
//                    todosUrlRequest.httpBody = dtparamsBody?.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
                todosUrlRequest.httpBody = "{\"Subject\"}".data(using: .utf8)
//                }
//                catch
//                {
//                    print("Error: cannot create JSON from todo")
//                    return
//                }
                
                let session = URLSession.shared
                
                let task = session.dataTask(with: todosUrlRequest as URLRequest)
                {
                    (data, responses, error) in
                    guard error == nil
                        else
                    {
                        print(error.debugDescription)
                        return
                    }
                    guard let responseData = data
                        else
                    {
                        print("Error: did not receive data")
                        return
                    }
                    
                    // parse the result as JSON, since that's what the API provides
                    do
                    {
                        guard let receivedData = try JSONSerialization.jsonObject(with: responseData, options: .mutableLeaves) as? NSDictionary
                        else
                        {
                            print("Could not get JSON from responseData as dictionary")
                            return
                        }
                        
                        //                    let decresponse = self.Base64Decoded(data: String(data: responseData, encoding: .utf8)!)
                        let decresponse = self.Base64Decoded(data: "eyJEYXRhIjoiZlFuM3VQYTZRVWEvTC9kVnpFeU1YNWtzYWZxcElHck1YbFpNaVdRaXZ0TklRTXl3em05ZGYxdHlZS3BKZUkzMiIsIktleSI6IkMzVlVaR0ZSWldYSENHRSJ9")
                        
                        let dtresponse = try JSONSerialization.jsonObject(with: decresponse as Data, options: .mutableLeaves) as? NSDictionary
                        
                        if((dtresponse?.object(forKey: "Key") as? String)! == STRING_SERVER_KEY_RESPONSE_PUBLIC)
                        {
                            //                        let decryptResponse = self.Base64Decoded(data: (dtresponse?.object(forKey: "Data") as? String)!)
                            let decryptResponse = self.Base64Decoded(data: "eyJEYXRhIjoiZlFuM3VQYTZRVWEvTC9kVnpFeU1YNWtzYWZxcElHck1YbFpNaVdRaXZ0TklRTXl3em05ZGYxdHlZS3BKZUkzMiIsIktleSI6IkMzVlVaR0ZSWldYSENHRSJ9")
                            let dataresult = try JSONSerialization.jsonObject(with: decryptResponse as Data, options: .mutableLeaves) as? NSDictionary
                            
                            result = dataresult!
                            //                        result = receivedData as NSDictionary
                        }
                        else
                        {
                            result = ["MessageTitle" : "", "MessageContent" : "Invalid Request"]
                        }
                        
                        
                        group.leave()
                    }
                    catch
                    {
                        result = ["MessageTitle" : "", "MessageContent" : error.localizedDescription]
                        group.leave()
                        return
                    }
                }
                task.resume()
        }
        group.wait()
        
        return result
    }
    
    func myEncrypt(string:String, keyString:String) -> NSString?
    {
//        let jsSource = try? String(contentsOfFile: Bundle.main.path(forResource: "TripleDESJS", ofType: "js")!)
//        let context = JSContext()
//        context?.evaluateScript(jsSource)
//        let testFunction = context?.objectForKeyedSubscript("testFunct")
//        let result = testFunction?.call(withArguments: ["the message"])
//        return (result?.toString()!)! as NSString
        
        let keyData = keyString.data(using: .utf8)!
        
        var digestData =  Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
//        let dsa = Base64Decoded(data: "amF2YXguY3J5cHRvLnNwZWMuU2VjcmV0S2V5U3BlY0BmZmZmZmU4Yg==")
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            keyData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(keyData.count), digestBytes)
            }
        }
        
        
        let qwe : [UInt32] = [111,203,135,89,50,162,43,227,136,116,207,248,250,98,2,239,111,203,135,89,50,162,43,227]
        digestData = NSData(bytes: qwe, length: qwe.count) as Data
//        digestData = qwe + qwe[0...7]
//        digestData = digestData + digestData[0...7]
        let data = string.data(using: .utf8)!
        let dataNS = data as NSData
        
        let iv : [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0]
        
        let cryptData    = NSMutableData(length: Int(dataNS.length) + kCCBlockSize3DES)!
        
        let keyLength              = size_t(kCCKeySize3DES)
        let operation: CCOperation = UInt32(kCCEncrypt)
        let algoritm:  CCAlgorithm = UInt32(kCCAlgorithm3DES)
        let options:   CCOptions   = UInt32(kCCModeCBC + kCCOptionPKCS7Padding)
        
        var numBytesEncrypted :size_t = 0
        
        let cryptStatus = CCCrypt(operation,
                                  algoritm,
                                  options,
                                  (digestData as NSData).bytes,
                                  keyLength,
                                  iv,
                                  dataNS.bytes,
                                  dataNS.length,
                                  cryptData.mutableBytes,
                                  cryptData.length,
                                  &numBytesEncrypted)
        
        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.length = Int(numBytesEncrypted)
            
            // Not all data is a UTF-8 string so Base64 is used
            let base64cryptString = cryptData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength76Characters)
            return base64cryptString as NSString
        } else {
            print("Error: \(cryptStatus)")
        }
        return ""
    }
    
    func myDecrypt(decryptData : NSData, keyData:String) -> NSString?
    {
//        let jsSource = try? String(contentsOfFile: Bundle.main.path(forResource: "TripleDESJS", ofType: "js")!)
//        let context = JSContext()
//        context?.evaluateScript(jsSource)
//        let testFunction = context?.objectForKeyedSubscript("testFunct")
//        let result = testFunction?.call(withArguments: ["the message"])
//        return (result?.toString()!)! as NSString
        
        let mydata_len : Int = decryptData.length
        let keyData : NSData = (keyData as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        
        let buffer_size : size_t = mydata_len + kCCBlockSizeAES128
        let buffer = malloc(buffer_size)
        var num_bytes_encrypted : size_t = 0
        
//        var iv : [UInt8] = [56, 101, 63, 23, 96, 182, 209, 205]  // I didn't use
        
        let operation: CCOperation = UInt32(kCCDecrypt)
        let algoritm:  CCAlgorithm = UInt32(kCCAlgorithm3DES)
        let options:   CCOptions   = UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding)
        let keyLength              = size_t(kCCKeySize3DES)
        
        let decrypt_status : CCCryptorStatus = CCCrypt(operation, algoritm, options, keyData.bytes, keyLength, nil, decryptData.bytes, mydata_len, buffer, buffer_size, &num_bytes_encrypted)
        
        if UInt32(decrypt_status) == UInt32(kCCSuccess)
        {
            let myResult : NSData = NSData(bytes: buffer, length: num_bytes_encrypted)
            free(buffer)
            
            return (String(data: myResult as Data, encoding: .utf8)! as NSString)
        }
        else
        {
            free(buffer)
            return nil
            
        }
    }
    
    func MD5(string: String) -> Data? {
        guard let messageData = string.data(using:String.Encoding.utf16) else { return nil }
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))

        _ = digestData.withUnsafeMutableBytes
        {
            digestBytes in messageData.withUnsafeBytes
            {
                messageBytes in CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }

        return digestData
    }
    
    func getEncryptionKey(_ secretKey:String)->String {
        let md5Data = MD5(string:secretKey) 
        let md5Hex =  md5Data!.map { String(format: "%02hhx", $0) }.joined()
        
        let secretKeyHex = secretKey
        
        let index = secretKeyHex.index(secretKeyHex.startIndex, offsetBy: 12)
        let first12 = secretKeyHex.substring(to: index)
        
        let last12 = md5Hex.substring(from:md5Hex.index(md5Hex.endIndex, offsetBy: -12))
        return first12 + last12
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
