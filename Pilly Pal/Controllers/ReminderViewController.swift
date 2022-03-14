//
//  ReminderViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 8/16/21.
//

import UIKit
import UserNotifications


class ReminderViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0:
            return frequencyData.count
        case 1:
            return howManyTimesData.count
        case 2:
            return doseData.count
        default:
            return 5
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 0:
            return frequencyData[row]
        case 1:
            return howManyTimesData[row]
        case 2:
            return doseData[row]
        default:
            return "0000000"
        }
    }
    
    @IBOutlet weak var medNameTextField: UITextField!
    @IBOutlet weak var strengthTextField: UITextField!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var howManyAdayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var doseLabel: UILabel!
    @IBOutlet weak var timeDatePickerOutlet: UIDatePicker!
    @IBOutlet weak var toolBarOutlet: UIToolbar!
    @IBOutlet weak var frequencyPicker: UIPickerView!
    @IBOutlet weak var howManyTimesPicker: UIPickerView!
    @IBOutlet weak var dosePicker: UIPickerView!
    
    var frequencyData = ["As Needed", "Every Day", "Days Interval"]
    var howManyTimesData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    var doseData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    var pushID = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolBarOutlet.isHidden = true
        timeDatePickerOutlet.isHidden = true
        frequencyPicker.isHidden = true
        howManyTimesPicker.isHidden = true
        dosePicker.isHidden = true
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(false, animated: true)

        medNameTextField.delegate = self
        strengthTextField.delegate = self
        frequencyPicker.delegate = self
        howManyTimesPicker.delegate = self
        dosePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (handleTap))
        view.addGestureRecognizer(tap)
        
        timeDatePickerOutlet.backgroundColor = #colorLiteral(red: 0.9380394816, green: 0.9827650189, blue: 0.9939692616, alpha: 1)
        frequencyPicker.backgroundColor = #colorLiteral(red: 0.9380394816, green: 0.9827650189, blue: 0.9939692616, alpha: 1)
        howManyTimesPicker.backgroundColor = #colorLiteral(red: 0.9380394816, green: 0.9827650189, blue: 0.9939692616, alpha: 1)
        dosePicker.backgroundColor = #colorLiteral(red: 0.9380394816, green: 0.9827650189, blue: 0.9939692616, alpha: 1)
    }
     
    @IBAction func frequencyPressed(_ sender: Any) {
        frequencyPicker.isHidden = false
        toolBarOutlet.isHidden = false
        medNameTextField.endEditing(true)
        strengthTextField.endEditing(true)
    }
    @IBAction func timesADayPressed(_ sender: Any) {
        howManyTimesPicker.isHidden = false
        toolBarOutlet.isHidden = false
        medNameTextField.endEditing(true)
        strengthTextField.endEditing(true)
    }
    @IBAction func timePressed(_ sender: Any) {
        timeDatePickerOutlet.isHidden = false
        toolBarOutlet.isHidden = false
    }
    @IBAction func dosePressed(_ sender: Any) {
        dosePicker.isHidden = false
        toolBarOutlet.isHidden = false
    }
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
        if timeDatePickerOutlet.isHidden == false {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            let selectedDate = dateFormatter.string(from: timeDatePickerOutlet.date)
            timeLabel.text = "\(selectedDate)"
            timeLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        }else if frequencyPicker.isHidden == false {
            frequencyLabel.text = frequencyData[frequencyPicker.selectedRow(inComponent: 0)]
            frequencyLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        }else if howManyTimesPicker.isHidden == false {
            howManyAdayLabel.text = "\(howManyTimesData[howManyTimesPicker.selectedRow(inComponent: 0)]) times a day"
            howManyAdayLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        }else if dosePicker.isHidden == false {
            doseLabel.text = "\(doseData[dosePicker.selectedRow(inComponent: 0)]) pills at a time"
            doseLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        }
        toolBarOutlet.isHidden = true
        timeDatePickerOutlet.isHidden = true
        frequencyPicker.isHidden = true
        howManyTimesPicker.isHidden = true
        dosePicker.isHidden = true
    }
    @IBAction func addPressed(_ sender: Any) {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = "Pill Time!"
        content.body = "Get a glass of water, its the time to take your pill"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
        
        center.add(request) { error in
            if error != nil{
                print("Error!")
            }
        }
        
        // create the alert
        let alert = UIAlertController(title: "Reminder added successfully!", message: "Add another one?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Add Another One", style: .default, handler: {action in
            
            self.medNameTextField.text = ""
            self.strengthTextField.text = ""
            self.frequencyLabel.textColor = .placeholderText
            self.frequencyLabel.text = "Frequency"
            self.howManyAdayLabel.textColor = .placeholderText
            self.howManyAdayLabel.text = "How Many Times A Day?"
            self.doseLabel.textColor = .placeholderText
            self.doseLabel.text = "Dose"
            self.timeLabel.textColor = .placeholderText
            self.timeLabel.text = "Time"
            
        }))
        alert.addAction(UIAlertAction(title: "Back to Main Screen", style: .default, handler: {action in
            
            self.performSegue(withIdentifier: "backToMainSegue", sender: self)
            
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            medNameTextField.endEditing(true)
        }else if textField.tag == 1 {
            strengthTextField.endEditing(true)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            strengthTextField.endEditing(true)
        }else if textField.tag == 1 {
            medNameTextField.endEditing(true)
        }
    }
    
    @objc func handleTap() {
        medNameTextField.endEditing(true)
        strengthTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            strengthTextField.text = strengthTextField.text ?? "500" + " mg"
        }
    }
}
