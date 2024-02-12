//
//  CommonMethods.swift
//  Surveyor
//
//  Created by Jaykant on 21/07/20.
//  Copyright © 2020 webmobril. All rights reserved.
//

import UIKit


class CommonMethods{
     static func displayAlert(viewController: UIViewController?, message: String?){
           guard let message = message else {return}
        let alert = UIAlertController(title: SStringConstants.title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: SStringConstants.ok, style: .default, handler: nil))
           //viewController.present(alert, animated: true, completion: nil)
        appDelegate?.window?.rootViewController?.present(alert, animated: true, completion: nil)
       }
}


class SurProgressView {
    
    private var containerView = UIView()
    private var progressView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    static let shared = SurProgressView()
    
    private init(){}
    
    func showProgressView(){
        containerView.frame = (appDelegate?.window!.frame)!
        containerView.center = (appDelegate?.window?.center)!
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = (appDelegate?.window?.center)!
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        appDelegate?.window!.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
}

//extension UIColor {
//    convenience init(hex: UInt32, alpha: CGFloat) {
//        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
//        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
//        let blue = CGFloat(hex & 0xFF)/256.0
//        
//        self.init(red: red, green: green, blue: blue, alpha: alpha)
//    }
//}
