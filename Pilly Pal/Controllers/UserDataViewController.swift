//
//  UserDataViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 7/14/21.
//

import UIKit
import NumberPicker

class UserDataViewController: UIViewController, NumberPickerDelegate, UITextFieldDelegate {
    
    func selectedNumber(_ number: Int) {
        if tag == 0{
            
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
    var tag = 5
    var userDateOfBirth = ""
        
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var datePickerDoneEditing: UIButton!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var datePcikerDoneOutlet: UIButton!
    @IBOutlet weak var genderOutlet: UISegmentedControl!
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.isHidden = true
        datePickerDoneEditing.isHidden = true
        datePcikerDoneOutlet.isHidden = true
        userNameTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (handleTap))
        view.addGestureRecognizer(tap)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func datePickerPicked(_ sender: Any) {
        
        
        //calculate user's age
        let birthDate = self.datePicker.date
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        let ageYears = components.year
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        userDateOfBirth = selectedDate
        userAge = ageYears ?? 0
        
    }
    
    @IBAction func userNameDidEnd(_ sender: UITextField) {
        
        userName = sender.text ?? "Default"
    }
    
    @IBAction func genderSelected(_ sender: UISegmentedControl) {
        
        let selectionNum = sender.numberOfSegments
        if selectionNum == 0 {
            userGender = "Male"

        } else {
            userGender = "Female"

        }
    }
    
    @IBAction func heightPressed(_ sender: UIButton) {
        
        userNameTextField.endEditing(true)
        tag = 0
        openNumberPicker(tag: tag)
        }

    
    
    @IBAction func weightPressed(_ sender: UIButton) {
        
        userNameTextField.endEditing(true)
        tag = 1
        openNumberPicker(tag: tag)
    }
    
    @IBAction func datePickerPressed(_ sender: UIButton) {
        datePicker.isHidden = false
        datePickerDoneEditing.isHidden = false
        datePcikerDoneOutlet.isHidden = false
        genderOutlet.isHidden = true
        userNameTextField.endEditing(true)
    }
    @IBAction func datePickerDone(_ sender: UIButton) {
        updateLabel()
        datePicker.isHidden = true
        datePcikerDoneOutlet.isHidden = true
        genderOutlet.isHidden = false
        userNameTextField.endEditing(true)
    }
    
    
    func updateLabel(){
        dateOfBirthLabel.text = "\(userDateOfBirth)"
        dateOfBirthLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
    }
    
    
    func openNumberPicker(tag: Int) {
        
        if tag == 0 {
            
            let numberPicker = NumberPicker(delegate: self, maxNumber: 250) // set max number
            numberPicker.bgGradients = [#colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1),#colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1)]
            numberPicker.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
            numberPicker.heading = "Height"
            numberPicker.defaultSelectedNumber = 170 // set default selected number
            numberPicker.tagNum = 0
            
            self.present(numberPicker, animated: true, completion: nil)
            
        }else if tag == 1{
            
            let numberPicker = NumberPicker(delegate: self, maxNumber: 200) // set max number
            numberPicker.bgGradients = [#colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1),#colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)]
            numberPicker.tintColor = #colorLiteral(red: 0.9310939312, green: 0.9826708436, blue: 0.997579515, alpha: 1)
            numberPicker.heading = "Weight"
            numberPicker.defaultSelectedNumber = 80 // set default selected number
            numberPicker.tagNum = 1
            
            self.present(numberPicker, animated: true, completion: nil)
            
        }
        userNameTextField.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MainViewController {
            let vc = segue.destination as? MainViewController
            vc?.userWeight = self.userWeight
            vc?.userHeight = self.userHeight
            vc?.userAge = self.userAge
            vc?.userDateOfBirth = self.userDateOfBirth
            vc?.userGender = self.userGender
            vc?.userName = self.userName
        }
    }
    
    @objc func handleTap() {
        userNameTextField.endEditing(true) // dismiss keyoard
    }
    
}
