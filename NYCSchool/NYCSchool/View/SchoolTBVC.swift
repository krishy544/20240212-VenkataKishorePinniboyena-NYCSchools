//
//  SchoolTBVC.swift
//  NYCSchool
//
//  Created by apcfss on 10/02/24.
//

import UIKit

class SchoolTBVC: UITableViewCell {
    
    
    @IBOutlet weak var lblSchoolName: UILabel!
     
     
     @IBOutlet weak var lblWriting: UILabel!

     
     @IBOutlet weak var lblReading: UILabel!
      
      
      @IBOutlet weak var lblMaths: UILabel!
     
     
     @IBOutlet weak var lblNumber: UILabel!
  
     
     @IBOutlet weak var uiViewwww: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
