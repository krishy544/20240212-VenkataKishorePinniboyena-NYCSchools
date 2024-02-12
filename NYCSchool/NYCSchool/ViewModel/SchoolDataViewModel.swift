//
//  SchoolDataViewModel.swift
//  NYCSchool
//
//  Created by apcfss on 10/02/24.
//

import Foundation
import KRProgressHUD

//MARK: - Get School Data View Model ✨✨✨✨✨✨✨✨

class SchoolDataViewModel:NSObject,UITextFieldDelegate{
    
     func getUserTypeData(completion: @escaping (_: Welcome) -> Void) {
        KRProgressHUD.show(withMessage: "Please Wait ...")
        
        APIManager.sharedInstance.getSchoolsDataDetails() { (data, response, error) in
            
           
            guard error == nil else{
                CommonMethods.displayAlert(viewController: nil, message: error?.localizedDescription)
                KRProgressHUD.dismiss()
                return
            }
            guard data != nil else{
                
                CommonMethods.displayAlert(viewController: nil, message: SStringConstants.dataNotReceived)
                KRProgressHUD.dismiss()
                
                return
            }
            do {
                let login = try JSONDecoder().decode(Welcome.self, from: data!)
                completion(login)
                KRProgressHUD.dismiss()
            } catch {
                KRProgressHUD.dismiss()
                CommonMethods.displayAlert(viewController: nil, message: error.localizedDescription)

                
            }
        }
    }
}

