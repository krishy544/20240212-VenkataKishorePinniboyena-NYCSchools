//
//  SConstants.swift
//  Surveyor
//
//  Created by Jaykant on 10/07/20.
//  Copyright © 2020 webmobril. All rights reserved.
//

import UIKit

extension UIColor{
    struct AppColor {
        static let themeColor = UIColor(red: 0/255, green: 114/255, blue: 190/255, alpha: 1)
    }
}



struct SStringConstants {
    static let title = "Alert"
    static let ok = "OK"
    static let cancel = "Cancel"
    static let enterUserName = "Please enter username"
    static let enterValidUserName = "Please enter valid username"
    static let enterPassword = "Please enter password"
    static let enterSSN = "Please enter social security number (ssn)"
    static let enterName = "Please enter name"
    static let enterValidName = "Please enter valid username"
    static let enterValidPhoneNum = "Phone Number must be 7 to 15 digit"
    static let enterValidPhone = "Please enter valid phone number"
    static let enterEmail = "Please enter Email Id"
    static let enterPhone = "Please enter phone number"
    static let pleaseEnterTitle = "Please enter title"
    static let enterEnterTitle = "Please enter valid title"
    static let enterSubject = "Please enter subject"
    static let enterEnterSubject = "Please enter valid subject"
    static let enterOpt = "Please enter OTP"
    static let enterAddress = "Please enter address"
    static let enterShortNote = "Please enter short note"
    static let enterOldPassword = "Please enter old password"
    static let enterNewPassword = "Please Enter New Password"
    
    static let enterNewMPIN = "Please Enter MPIN"
    static let enterConfirPassword = "Please Enter Confirm Password"
    
    static let enterConfirMPIN = "Please Enter Confirm MPIN"

    
     static let invalidEmail = "Invalid email id"
    static let invalidPassword = "Pin Must 6 digits Numbers"
    
    static let invalidMPIN = "MPIN Must 6 digits Numbers"
    static let invalidPhone = "Phone number must be 7 to 15 digit"
    static let passwordDoesntMatch = "New Password and Confirm Password doesn't match"
    
    static let mpinDoesntMatch = "MPIN and Confirm MPIN doesn't match"
    static let invalidOtp = "Invalid OTP"
    static let addInformation = "Add more info"
    static let goToSettings = "Go settings to allow access"
    static let cameraNoDetected = "Oops We were not able to detect a Camera/Or we need permission to use your Camera in order to take pictures."
    static let uploadDocument = "Upload document"
    static let checkInternet = "Check your internet connection"
    static let somethingWentWrong = "Something went wrong"
    static let doYouWantLogout = "Do you want to logout?"
    static let dataNotReceived = "Data not received"
}


 
enum URLConstants{
    
   // static let urlUserAllData = URL(string: "http://www.json-generator.com/api/json/get/ceiNKFwyaa?indent=2")
    

    static var baseAPIUrl: URL { return URL(string: "https://data.cityofnewyork.us/")!}
     
 
    static var getNYCSchoolsData: URL { return
        baseAPIUrl.appendingPathComponent("resource/s3k6-pzi2.json")}
     
  
    
}

 
