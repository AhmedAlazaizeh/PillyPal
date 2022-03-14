//
//  CalculatedBMIViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/26/21.
//

import UIKit

class CalculatedBMIViewController: UIViewController {

    var BMIScore: Double = 0.0
    
    @IBOutlet weak var BMIScoreLabel: UILabel!
    @IBOutlet weak var BMITextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BMIScoreLabel.text = "\(BMIScore)"
        
        if BMIScore < 18.5 {
            BMITextLabel.text = "Eat more Pies!"
            view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }else if BMIScore < 24.9 {
            BMITextLabel.text = "Fit as a fiddle!"
            view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }else if BMIScore > 24.9 {
            BMITextLabel.text = "Eat less Pies!"
            view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
}
