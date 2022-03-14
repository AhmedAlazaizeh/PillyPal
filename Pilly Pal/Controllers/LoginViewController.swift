//
//  LoginViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/12/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1)
        
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e.localizedDescription)
                    // create alert for error
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
        
    }
}
