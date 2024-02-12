//
//  Extensions.swift
//  SafetyAudit
//
//  Created by Naveen Sudireddy on 2/24/19.
//  Copyright © 2019 Covantech Mac Mini. All rights reserved.
//

import Foundation
import UIKit

func showAlert(title: String, message: String) {
  DispatchQueue.main.async {

    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    if let topViewControler = UIApplication.shared.topMostViewController {
      
      topViewControler.present(alert, animated: true,completion: nil)
      
    }

  }
  
}
 

extension Optional where Wrapped == String {
  var isBlank: Bool {
    return self?.isEmpty ?? true && (self ?? "").count == 0
  }
}
extension Optional where Wrapped == Int{
  var isBlankInt: Bool{
    return self == nil  || self == 0
  }
}
extension UIImageView {
  
  func setBottomLine(borderColor: UIColor) {
    let borderLine = UIView()
    borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - 1.0, width: Double(self.frame.width), height: 1.0)
    borderLine.backgroundColor = borderColor
    borderLine.autoresizingMask = .flexibleWidth
    self.addSubview(borderLine)
  }
  
}

//extension String{
//  var stripSpecialCharacters: String {
//    let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890-")
//    return self.filter {okayChars.contains($0) }
//  }
//}


extension String{
    var removeWhiteSpace: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isfirstNameValid : Bool {
                  let regEx = "[A-Za-z0-9]{2,64}"
                  let test = NSPredicate(format:"SELF MATCHES %@", regEx)
                  return test.evaluate(with: self)
              }
     var isValidEmail: Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPred.evaluate(with: self)
    }
     var isValidPassword: Bool{
        //let passwordPred = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Za-z0-9]).{7,16}")
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", "^[0-9]")
              
       // ^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,10}
        return passwordPred.evaluate(with: self)
    }
  
    
    
     var isValidMobile: Bool{
        let mobilePred = NSPredicate(format: "SELF MATCHES %@", "^[0-9]{7,15}$")
        
        //^[0-9]{10}$
         //^((\\+)|(00))[0-9]{6,14}$
         //Jay Code
         //^\\d{3}-\\d{3}-\\d{4}{6,14}$
        
        //^\\d{3}-\\d{3}-\\d{4}$
        return mobilePred.evaluate(with: self)
    }
     var mobileFormatting: String{
        var temp = ""
        var index = 1
        for ch in self{
            if (index == 3 || index == 6){
               temp = temp + String(ch) + "-"
            }else{
                temp = temp + String(ch)
            }
            index += 1
        }
        return temp
    }
}

protocol ObjectSavable {
   func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
   func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
enum ObjectSavableError: String, LocalizedError {
   case unableToEncode = "Unable to encode object into data"
   case noValue = "No data object found for the given key"
   case unableToDecode = "Unable to decode object into given type"
    var errorDescription: String? {
       rawValue
   }
}
extension UserDefaults: ObjectSavable {
   func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
       let encoder = JSONEncoder()
       do {
           let data = try encoder.encode(object)
           set(data, forKey: forKey)
       } catch {
           throw ObjectSavableError.unableToEncode
       }
   }
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
       guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
       let decoder = JSONDecoder()
       do {
           let object = try decoder.decode(type, from: data)
           return object
       } catch {
           throw ObjectSavableError.unableToDecode
       }
   }
}

extension UIApplication {
  var topMostViewController : UIViewController? {
    return self.keyWindow?.rootViewController?.topMostViewController
  }
}
extension UIViewController {
  var topMostViewController : UIViewController {
    
    if let presented = self.presentedViewController {
      return presented.topMostViewController
    }
    
    if let navigation = self as? UINavigationController {
      return navigation.visibleViewController?.topMostViewController ?? navigation
    }
    
    if let tab = self as? UITabBarController {
      return tab.selectedViewController?.topMostViewController ?? tab
    }
    
    return self
  }
}

extension UITextField {
  
  func setBottomLine(borderColor: UIColor) {
    
    self.borderStyle = UITextField.BorderStyle.none
    self.backgroundColor = UIColor.clear
    
    let borderLine = UIView()
    borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - 1.0, width: Double(self.frame.width), height: 1.0)
    borderLine.backgroundColor = borderColor
    borderLine.autoresizingMask = .flexibleWidth
    self.addSubview(borderLine)
  }
  func setLayoutBorder() {
    self.layer.borderWidth=1.0
    self.layer.borderColor = UIColor.init(red: 197/255, green: 197/255, blue: 197/255, alpha: 1.0).cgColor
    self.layer.cornerRadius=2
    self.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 5, height: self.frame.height))
    self.leftViewMode = UITextField.ViewMode.always
  }
  
  
}
extension UITextView{
  func setLayoutBorder() {
    self.layer.cornerRadius = 2
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.init(red: 197/255, green: 197/255, blue: 197/255, alpha: 1.0).cgColor
  }
}

extension UIButton{
  func applyBorder() {
    self.layer.cornerRadius = 10
    
  }
}
