//
//  ViewController.swift
//  NYCSchool
//
//  Created by apcfss on 10/02/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK: - Properties ✨✨✨✨✨✨✨✨

    
    var getSchoolDataViewModel = SchoolDataViewModel()
    var getSchoolData = [SchoolModel]()

    @IBOutlet weak var  tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getSchoolDataData()
        
     }
    //MARK: - Get School Data Data ✨✨✨✨✨✨✨✨
    
    func getSchoolDataData(){
        getSchoolDataViewModel.getUserTypeData { [self] schoolData in
            print(schoolData.count)
            
            DispatchQueue.main.async { [self] in
                getSchoolData = schoolData
                tableView.reloadData()
            }
             
            
            print(schoolData[0])
            
        }
        
    }
    
    //MARK: - UItableview Data Source and Delegate Methods ✨✨✨✨✨✨✨✨

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getSchoolData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SchoolTBVC") as! SchoolTBVC
        cell.lblSchoolName.text = "\(getSchoolData[indexPath.row].schoolName ?? "")"

        
        
        
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SchoolDetailsVC") as! SchoolDetailsVC
        
        vc.singleSchoolData = getSchoolData[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 200
        }
    
    

}

