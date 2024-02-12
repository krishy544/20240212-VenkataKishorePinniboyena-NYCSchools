//
//  GlobalPool.swift
//  DoorVideoCall
//
//  Created by Anitha on 5/10/19.
//  Copyright © 2017 Twilio, Inc. All rights reserved.
//

import UIKit

  let TheGlobalPoolManager = GlobalPool.sharedInstance

class GlobalPool: NSObject {
    static let sharedInstance = GlobalPool()
 
    var urlName = URL(string: "kjlsdfskjdfkfsdkfgskfgsdkljf")
    
    var userRoll = Int()
    
    
    var pickerViewName = String()
    
    var parentStrudentID = String()
    
    var college_code = Int()
    
     
    override init() {
        super.init()
    }
    
  
    
    func buttonMethod(button:UIButton)  {
        button.layer.cornerRadius =  button.layer.frame.size.height / 2
    }
 
    // MARK : - Converting Total Seconds to hh:mm:ss
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    // MARK : - Removing all special characters in string
    // MARK : - Counting Age
    
    func ageCount(_ birthYear: String) -> String {
        let components: DateComponents? = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let age = Int((components?.year)!) - (birthYear as NSString).integerValue
        return "\(age - 1)"
    }
    
    //MARK: - Removing Special Characters from string
    func removeSpecialCharactersInArray(_ stringToRemove:String) -> String{
        let string = stringToRemove
        let removeChars = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890,.:!_\'")
        let charArray = string.components(separatedBy:removeChars.inverted) as NSArray
        let removedString = charArray.componentsJoined(by: "")
        return removedString
    }
    // MARK : - De-coding to Base 64 String UIImage
    func decodeBase64(toImage strEncodeData: String) -> UIImage {
        let data = Data(base64Encoded: strEncodeData, options: .ignoreUnknownCharacters)
        return UIImage(data: data!)!
    }
    //MARK : - Email Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    //MARK : - UIButton Border and Corner radius
    func viewFrameMethod(view:UIView)  {
        view.layer.cornerRadius = view.layer.frame.size.height / 2
        view.layer.masksToBounds = true
    }
 
    //MARK: - Label Frame and Corner radius
    func labelFrame(_ label: UILabel) {
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
    }
    //MARK: - Printing JSON Object.
    func jsonToString(json: AnyObject){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString ?? "defaultvalue")
        } catch let myJSONError {
            print(myJSONError)
        }
    }
    //MARK : - Logout Method
    func logout(){
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
            UIApplication.shared.unregisterForRemoteNotifications()
        }
    }
 
 }

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension String {
    func withReplacedCharacters(_ characters: String, by separator: String) -> String {
        let characterSet = CharacterSet(charactersIn: characters)
        return components(separatedBy: characterSet).joined(separator: separator)
    }
}

 
//MARK:- Version number and Build Number
extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
//MARK:- Captilaize First Letter
extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}

extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
         scanner.charactersToBeSkipped = NSCharacterSet ( charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}

 
    
    
    
 
