//
//  SearchViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/27/21.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var drugName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.delegate = self
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(false, animated: true)
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        if let drug = searchTextField.text{
            drugName = drug
        }
        performSegue(withIdentifier: "showSearchResultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SearchResultViewController {
            let vc = segue.destination as? SearchResultViewController
            vc?.drugName = self.drugName

        }
    }
    
}
