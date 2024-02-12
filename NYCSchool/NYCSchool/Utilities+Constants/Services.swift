//
//  Services.swift
//  Surveyor
//
//  Created by Jaykant on 10/08/20.
//  Copyright © 2020 webmobril. All rights reserved.
//

import UIKit
import SystemConfiguration
import Alamofire
import KRProgressHUD

typealias ApiCompletionHandler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
 
 
class APIManager{
    
     static let sharedInstance = APIManager()
     private init() {}
     fileprivate let defaultHeader: HTTPHeaders = [.accept("application/json")]
     // Methods for network connection
    var isNetworkConnected: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
         guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
         var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
         let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    func startRequest(url:URL, method:HTTPMethod, parameters:Parameters? = nil, encoding: JSONEncoding = .default, headers: HTTPHeaders? = nil, completion: @escaping ApiCompletionHandler) {
       guard isNetworkConnected else{
           IJProgressView.shared.hideProgressView()
            
           return
       }
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON{ response in
           switch response.result{
           case .success:
                
               completion(response.data, response.response, response.error)
           case .failure(let error):
               completion(response.data, response.response, error)
           }
       }
   }
   
    
     func getRequest(url:URL, method:HTTPMethod,completion: @escaping ApiCompletionHandler) {
        
        guard isNetworkConnected else{
            
            KRProgressHUD.dismiss()
                       IJProgressView.shared.hideProgressView()
            showAlert(title: "Alert", message: "Check Internet")
             return
        }
        AF.request(url, method: method, encoding: JSONEncoding.default)
                .responseJSON { response in
                   switch response.result {
                   case .success:
            completion(response.data, response.response, response.error)

                    case .failure(let error):
        completion(response.data, response.response, error)
                        print(error)
                    }
            }
     }
    
    func startGetRequest(url:URL, method:HTTPMethod,encoding: JSONEncoding = .default, completion: @escaping ApiCompletionHandler) {
       guard isNetworkConnected else{
           IJProgressView.shared.hideProgressView()
           
           return
       }
        AF.request(url, method: method).responseJSON{ response in
           switch response.result{
           case .success:
                completion(response.data, response.response, response.error)
           case .failure(let error):
               completion(response.data, response.response, error)
           }
       }
   }
     func requestWithFileUpload(fileData: Data, url:URL, method:HTTPMethod, parameters:Parameters? = nil, encoding: JSONEncoding = .default, headers: HTTPHeaders? = nil, completion: @escaping ApiCompletionHandler) {
        guard isNetworkConnected else{
            IJProgressView.shared.hideProgressView()
            
            return
        }
         AF.upload(multipartFormData: { multipartData in
  
            for (key, value) in parameters!{
                multipartData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
            }
             multipartData.append(fileData, withName: "live_photo", fileName: "file.png", mimeType: "application/pdf")
             
        }, to: url, method: .post, headers: headers).responseJSON { response in
            switch response.result{
            case .success:
                
                completion(response.data, response.response, response.error)
            case .failure(let error):
                completion(response.data, response.response, error)
            }
        }
    }
    
    func requestWithFileUpload1(fileData: Data, url:URL, method:HTTPMethod, parameters:Parameters? = nil, encoding: JSONEncoding = .default, headers: HTTPHeaders? = nil, completion: @escaping ApiCompletionHandler) {
            guard isNetworkConnected else{
                IJProgressView.shared.hideProgressView()
                
                return
            }
             AF.upload(multipartFormData: { multipartData in
                 
                for (key, value) in parameters!{
                    multipartData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
                 multipartData.append(fileData, withName: "image", fileName: "file.png", mimeType: "application/pdf")
                 
            }, to: url, method: .post, headers: headers).responseJSON { response in
                switch response.result{
                case .success:
                     
                    completion(response.data, response.response, response.error)
                case .failure(let error):
                    completion(response.data, response.response, error)
                }
            }
        }
    
    func requestWithImage(fileData: Data?, url:URL, method:HTTPMethod, parameters:Parameters? = nil, encoding: JSONEncoding = .default, headers: HTTPHeaders? = nil, completion: @escaping ApiCompletionHandler) {
        guard isNetworkConnected else{
            IJProgressView.shared.hideProgressView()
            
            return
        }
        
        AF.upload(multipartFormData: { multipartData in
            if let fileData = fileData{
                multipartData.append(fileData, withName: "profile_image", fileName: "userProfile.jpg", mimeType: "image/jpg")
            }
            for (key, value) in parameters!{
                multipartData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, method: .post, headers: headers).responseJSON { response in
            switch response.result{
            case .success:
                completion(response.data, response.response, response.error)
            case .failure(let error):
                completion(response.data, response.response, error)
            }
        }
    }
}

extension APIManager {
  
    
    // Get SchoolsData API "Get"
          
     func getSchoolsDataDetails(completion: @escaping ApiCompletionHandler) {
               self.getRequest(url: URLConstants.getNYCSchoolsData , method: .get) { (data, response, error) in
                  completion(data, response, error)
               }
          }
    
    

}

