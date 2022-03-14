//
//  BMIViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/26/21.
//

import UIKit
import NumberPicker

class BMIViewController: UIViewController, NumberPickerDelegate {
    
    func selectedNumber(_ number: Int) {
        if tag == 0 {
            
            heightLabel.text = "\(number) cm"
            heightLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
            userHeight = number
        } else if tag == 1 {
            
            weightLabel.text = "\(number) kg"
            weightLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
            userWeight = number
        }
    }
    
    var userName = ""
    var userGender = ""
    var userAge = 0
    var userHeight = 0
    var userWeight = 0
    var userDateOfBirth = ""
    var tag = -1
    var BMI: Double = 0.0
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightLabel.text = "\(userHeight) cm"
        heightLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        
        weightLabel.text = "\(userWeight) kg"
        weightLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(false, animated: true)
        
    }
    
    @IBAction func heightPressed(_ sender: UIButton) {
        
        tag = 0
        openNumberPicker(tag: tag)
        
    }
    
    @IBAction func weightPressed(_ sender: UIButton) {
        
        tag = 1
        openNumberPicker(tag: tag)
        
    }
    
    func openNumberPicker(tag: Int) {
        
        if tag == 0 {
            
            let numberPicker = NumberPicker(delegate: self, maxNumber: 250) // set max number
            numberPicker.bgGradients = [#colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1),#colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1)]
            numberPicker.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
            numberPicker.heading = "Height"
            numberPicker.defaultSelectedNumber = userHeight // set default selected number
            numberPicker.tagNum = 0
            
            self.present(numberPicker, animated: true, completion: nil)
            
        }else if tag == 1{
            
            let numberPicker = NumberPicker(delegate: self, maxNumber: 200) // set max number
            numberPicker.bgGradients = [#colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1),#colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)]
            numberPicker.tintColor = #colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1)
            numberPicker.heading = "Weight"
            numberPicker.defaultSelectedNumber = userWeight // set default selected number
            numberPicker.tagNum = 1
            
            self.present(numberPicker, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func calculateBMIPressed(_ sender: UIButton) {
        
        let height: Double = Double(userHeight)
        let weight: Double = Double(userWeight)
        let newBMI = 10000 * (weight / pow(height, 2))
        let shortenedBMI = String(format: "%1.1f", newBMI) // It rounds to 2
        BMI = Double(shortenedBMI) ?? newBMI
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CalculatedBMIViewController {
            let vc = segue.destination as? CalculatedBMIViewController
            vc?.BMIScore = BMI
        }
    }
    
}


