//
//  UIAlertController+Extensions.swift
//  BROApproval
//
//  Created by apcfss on 01/09/21.
//  Copyright © 2021 apcfss. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    // Show Alert
    
    class func showAlert(vc:UIViewController,title:String,message:String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true)
        }
       
    }
    
    
    class func showAlertWithOkAction(_ vc:UIViewController,title:String,message:String,buttonTitle:String,buttonAction:@escaping ()-> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: {(alert: UIAlertAction!) in
            buttonAction()
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    
    class func showAlertWithOkAndCancelAction(_ vc:UIViewController,title:String,message:String,buttonCancelTitle:String,buttonOkTitle:String,buttonCancelAction:@escaping ()-> Void,buttonOkAction:@escaping ()-> Void) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
       
         alert.addAction(UIAlertAction(title: buttonCancelTitle, style: .destructive, handler: {(alert: UIAlertAction!) in
            buttonCancelAction()
        }))
        alert.addAction(UIAlertAction(title: buttonOkTitle, style: .default, handler: {(alert: UIAlertAction!) in
            buttonOkAction()
        }))
         vc.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithOkAndCancellAction(_ vc:UIViewController,title:String,message:String,buttonCancelTitle:String,buttonOkTitle:String,buttonCancelAction:@escaping ()-> Void,buttonOkAction:@escaping ()-> Void) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
       
         alert.addAction(UIAlertAction(title: buttonCancelTitle, style: .default, handler: {(alert: UIAlertAction!) in
            buttonCancelAction()
        }))
        alert.addAction(UIAlertAction(title: buttonOkTitle, style: .default, handler: {(alert: UIAlertAction!) in
            buttonOkAction()
        }))
         vc.present(alert, animated: true, completion: nil)
    }
    
    class func showToast(vc:UIViewController,title:String,message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.layer.cornerRadius = 15
        
        vc.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    class func showToastBottom(vc:UIViewController, message : String) {
        
         let toastLabel = UILabel(frame: CGRect(x: vc.view.frame.size.width/2 - 95, y: vc.view.frame.size.height-100, width: 220, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        
        toastLabel.font = toastLabel.font.withSize(13)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        vc.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
        
    }
}


