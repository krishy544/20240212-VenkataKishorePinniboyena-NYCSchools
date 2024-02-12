//
//  SchoolDetailsVC.swift
//  NYCSchool
//
//  Created by apcfss on 12/02/24.
//

import UIKit

class SchoolDetailsVC: UIViewController,UITextViewDelegate {
    
    //MARK: - Properties ✨✨✨✨✨✨✨✨

    
    var singleSchoolData: SchoolModel?
    
    @IBOutlet weak var lblSchoolName: UILabel!

    
    @IBOutlet weak var lblDetailsOfSchool: UILabel!
     
     
     @IBOutlet weak var lblOverViewParagraph: UITextView!
    
    
    @IBOutlet weak var lblStudentsNumber: UILabel!
    
    @IBOutlet weak var lblCode: UILabel!
    
    @IBOutlet weak var lblFinalGrades: UILabel!
    
    @IBOutlet weak var lblSeats: UILabel!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblOverViewParagraph.delegate = self
        self.lblSchoolName.text = "\(singleSchoolData?.schoolName ?? "")"
        
        self.lblDetailsOfSchool.text = "\(singleSchoolData?.requirement51 ?? "")\n\(singleSchoolData?.offerRate1 ?? "")\n\(singleSchoolData?.program1 ?? "")"
        
        self.lblOverViewParagraph.text = "\(singleSchoolData?.overviewParagraph ?? "")"
        
        self.lblStudentsNumber.text = "\(singleSchoolData?.totalStudents ?? "")"
        
        self.lblCode.text = "\(singleSchoolData?.buildingCode ?? "")"
        
        self.lblFinalGrades.text = "\(singleSchoolData?.finalgrades ?? "")"
        
        self.lblSeats.text = "\(singleSchoolData?.seats9Ge1 ?? "")"

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)

     }
    //MARK: - Keyboard Dismiss ✨✨✨✨✨✨✨✨

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Back Button ✨✨✨✨✨✨✨✨

    
    @IBAction func backBtn(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - UI TextView Delegate Methods  ✨✨✨✨✨✨✨✨

    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
          if text == "" {
              textView.resignFirstResponder()
              return false
          }
          return true
      }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lblOverViewParagraph.resignFirstResponder()
    }

}
