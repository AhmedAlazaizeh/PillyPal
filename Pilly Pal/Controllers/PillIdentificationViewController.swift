//
//  PillIdentificationViewController.swift
//  Pilly Pal
//
//  Created by ΛZ on 8/8/21.
//

import UIKit

class PillIdentificationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return colorPickerData.count
        }else {
            return shapePickerData.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return colorPickerData[row]
        }else {
            return shapePickerData[row]
        }
    }
    
    
    
    var imprint = ""
    var color = ""
    var shape = ""
    
    @IBOutlet weak var imprintTextField: UITextField!
    @IBOutlet weak var colorPickerDone: UIButton!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var shapePicker: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var shapePickerDone: UIButton!
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    var colorPickerData = ["Black", "Blue", "Brown", "Gray", "Green", "Orange", "Pink", "Purple", "Red", "White", "Yellow" ]
    
    var shapePickerData = ["Round", "Oblong", "Oval", "Square", "Rectangle", "Diamond" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (handleTap))
        view.addGestureRecognizer(tap)
        
        imprintTextField.delegate = self
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.reloadAllComponents()
        shapePicker.delegate = self
        shapePicker.dataSource = self
        shapePicker.reloadAllComponents()
        
        colorPickerDone.isHidden = true
        colorPicker.isHidden = true
        shapePicker.isHidden = true
        shapePickerDone.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        imprintTextField.endEditing(true)
    }
    
    @IBAction func imprintDidEnd(_ sender: UITextField) {
        imprint = imprintTextField.text ?? ""
    }
    
    @objc func handleTap() {
        imprintTextField.endEditing(true)
    }
    
    @IBAction func colorDonePressed(_ sender: UIButton) {
        colorPickerDone.isHidden = true
        colorPicker.isHidden = true
        colorLabel.text = colorPickerData [colorPicker.selectedRow(inComponent: 0)]
        color = colorLabel.text ?? ""
        colorLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        searchButton.isHidden = false
    }
    @IBAction func colorButton(_ sender: UIButton) {
        colorPicker.isHidden = false
        colorPickerDone.isHidden = false
        imprintTextField.endEditing(true)
        searchButton.isHidden = true
    }
    
    @IBAction func shapeDonePressed(_ sender: UIButton) {
        shapePickerDone.isHidden = true
        shapePicker.isHidden = true
        shapeLabel.text = shapePickerData [shapePicker.selectedRow(inComponent: 0)]
        shape = shapeLabel.text ?? ""
        shapeLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
        searchButton.isHidden = false
    }
    @IBAction func shapeButton(_ sender: UIButton) {
        shapePicker.isHidden = false
        shapePickerDone.isHidden = false
        imprintTextField.endEditing(true)
        searchButton.isHidden = true
        
        colorPickerDone.isHidden = true
        colorPicker.isHidden = true
        colorLabel.text = colorPickerData [colorPicker.selectedRow(inComponent: 0)]
        color = colorLabel.text ?? ""
        colorLabel.textColor = #colorLiteral(red: 0.1618608534, green: 0.8007312417, blue: 1, alpha: 1)
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PillIdentificationResultViewController {
            let vc = segue.destination as? PillIdentificationResultViewController
            vc?.imprint = self.imprint
            vc?.color = self.color
            vc?.shape = self.shape
        }
    }
}

