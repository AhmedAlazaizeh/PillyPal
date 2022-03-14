//
//  ViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/6/21.
//

import UIKit
import CLTypingLabel

class StartingViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "PillyPal"
        
        //force light mode
        overrideUserInterfaceStyle = .light
        
        //make navbar transparent
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    
    //hide nav bar from firsit view controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
}

