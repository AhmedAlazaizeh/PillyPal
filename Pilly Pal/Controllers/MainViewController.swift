//
//  MenuViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var userName = ""
    var userGender = ""
    var userAge = 0
    var userHeight = 0
    var userWeight = 0
    var userDateOfBirth = ""
    
    @IBOutlet weak var mainNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.mainNavBar.setBackgroundImage(UIImage(), for: .default)
           self.mainNavBar.shadowImage = UIImage()
           self.mainNavBar.isTranslucent = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSideMenu" {
            let navController = segue.destination as! UINavigationController
            let vc = navController.topViewController as! SideMenuViewController
            
            vc.userWeight = self.userWeight
            vc.userHeight = self.userHeight
            vc.userAge = self.userAge
            vc.userDateOfBirth = self.userDateOfBirth
            vc.userGender = self.userGender
            vc.userName = self.userName
            
        }else if segue.destination is BMIViewController {
            let vc = segue.destination as? BMIViewController
            
            vc?.userWeight = self.userWeight
            vc?.userHeight = self.userHeight
            vc?.userAge = self.userAge
            vc?.userDateOfBirth = self.userDateOfBirth
            vc?.userGender = self.userGender
            vc?.userName = self.userName
            
        }
    }
    
}

