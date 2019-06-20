//
//  NetworkConnection.swift
//  Eventhub-Client
//
//  Created by Salma Atef Saeid on 6/16/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import Foundation
import Alamofire


class NetworkConnection{
    
    // fetch by json
    func executeAPICallByJson(urlString: String, httpMethod: String, parameters: [String:Any]?,
                              header: [String:String]?, successHandler: @escaping([String:Any]) -> Void, failureHandler: @escaping(Error) -> Void){
        guard let apiURL = URL(string: urlString) else {return}
        if let isReachable = NetworkReachabilityManager(host: apiURL.host ?? "")?.isReachable, isReachable == true{
            Alamofire.request(apiURL, method: HTTPMethod(rawValue: httpMethod) ?? .get, parameters: parameters, headers: header).responseJSON{(dataResponse) in
                if let error = dataResponse.error{
                    failureHandler(error)
                }else if let json : [String : Any] = (dataResponse.result.value as! [String : Any]) {
                    successHandler(json)
                }
                
            }
        }else{
            let error = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue, userInfo: nil) as Error
            failureHandler(error)
        }
    }
}


public enum HTTPMethodType: String {
    
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
    
}
