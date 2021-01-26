//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billTotal = 0.0
    var tip = 0.1
    var numberOfPeople = 2
    var result = "0.0"

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        billTextField.endEditing(true)
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
                let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
                let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
                tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text ?? "0.0")!
        
        result = String(format: "%.2f", billTotal * Double((1 + tip)) / Double(numberOfPeople))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bill = result
            destinationVC.person = numberOfPeople
            destinationVC.tip = Int(tip * 100)
        }
    }
}


