//
//  SNavigationHelper.swift
//  Surveyor
//
//  Created by Jaykant on 09/07/20.
//  Copyright © 2020 webmobril. All rights reserved.
//

import UIKit

class SNavigationHelper{
    static func setNavigationBarClearBackground(navigationController: UINavigationController?, for viewController: UIViewController){
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.blue,
                     NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
    }
    
    static func setNavigationBarThemeColorBackground(navigationController: UINavigationController?, for viewController: UIViewController){
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                     NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.barTintColor = UIColor.AppColor.themeColor
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false

    }
}

class NoDataView{
    static func setLabel(view: UIView){
        let noDataLbl = UILabel()
        noDataLbl.frame = view.frame
        noDataLbl.center.x = view.center.x
        noDataLbl.center.y = view.center.y
        noDataLbl.textColor = .lightGray
        noDataLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        noDataLbl.text = "No Data Available"
        noDataLbl.textAlignment = .center
        view.addSubview(noDataLbl)
    }
 }
