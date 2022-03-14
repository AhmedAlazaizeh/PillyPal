//
//  RegisterViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/12/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var guestOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        
        //make text underlined
        guestOutlet.titleLabel!.attributedText = NSAttributedString(string: "Text!!!", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print(e.localizedDescription)
                    // create alert for error
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "UserDataSegue", sender: self)
                }
            }
        }
        
    }
    
    @IBAction func guestPressed(_ sender: UIButton) {
    }
}
