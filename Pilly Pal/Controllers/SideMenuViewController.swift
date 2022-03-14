//
//  SideMenuViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/13/21.
//

import UIKit
import Firebase

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var userName = ""
    var userGender = ""
    var userAge = 0
    var userHeight = 0
    var userWeight = 0
    var userDateOfBirth = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("121212\(userName)")
        testLabel.text = "Hi, \(userName)!"
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        // create the alert
        let alert = UIAlertController(title: "Logging Out!", message: "Are you sure you want to log out?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Log out!", style: UIAlertAction.Style.destructive, handler: {action in
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.performSegue(withIdentifier: "logOutSegue", sender: self)
                
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
}

