//
//  WebServiceHelper.swift
//  FaceDox
//
//  Created by Naveen on 06/06/2018.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

typealias ServiceResponse = (Any, NSError?) -> Void

class WebServiceHelper: NSObject,URLSessionDelegate,URLSessionTaskDelegate {
    
    static let sharedInstance = WebServiceHelper()
    var window = UIApplication.shared.windows.first
    var urlSession: URLSession!
    
    //MARK: GET METHOD
    func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        
        guard URL(string: path) != nil else {
            return
        }
        
        
        let urlwithPercentEscapes = path.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let request = NSMutableURLRequest(url: NSURL(string: urlwithPercentEscapes!)! as URL)
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData
        urlSession = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        
        
        let task = urlSession?.dataTask(with: (request as URLRequest) as URLRequest, completionHandler: {data, response, error -> Void in
            // var json:NSDictionary = [:]
            
            var result : Any = []
            
            if  data != nil {
                do{
                    result = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                } catch {
                    
                }
            }
            else {
                print(error?.localizedDescription ?? "")
            }
            onCompletion(result, error as NSError?)
            
        })
        task?.resume()
    }
    
    //MARK: POST METHOD
    func makeHTTPPostRequest(path: String, body: String , onCompletion: @escaping ServiceResponse) {
        let _: NSError?
        
        let urlwithPercentEscapes = path.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        let request = NSMutableURLRequest(url: NSURL(string: urlwithPercentEscapes!)! as URL)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
        } catch {
            return
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData
        urlSession = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        let task = urlSession.dataTask(with: request as URLRequest, completionHandler: {data, response, err  -> Void in
            
            var json:NSDictionary = [:]
            if data != nil {
                do{
                    json = try JSONSerialization.jsonObject(with: data!, options: [.mutableContainers]) as! NSDictionary
                } catch {
                    print(error)
                }
            }
            onCompletion(json, err as NSError?)
        })
        task.resume()
    }

}
