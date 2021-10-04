//
//  ViewController.swift
//  Calculator
//
//  Created by user193216 on 9/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayTextArea: UITextField!
    @IBOutlet weak var errorMsg: UILabel!
    
    @IBOutlet weak var historyTextArea: UITextView!
    
    var outputString = ""
    var historyString = ""
    let calculator = Calculator()
    
    @IBAction func inputClicked(_ sender: Any) {
        let inputString = (sender as! UIButton).titleLabel!.text!

        calculator.push(s: inputString)
        
        outputString += " " + inputString
        displayTextArea.text = outputString
    }
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        outputString = ""
        displayTextArea.text = ""
        errorMsg.isHidden = true
        calculator.clear()
    }
    
    @IBAction func calculate(_ sender: Any) {
        if calculator.validate() {
            outputString += " = " + String(calculator.calc())
            displayTextArea.text = outputString
            
            if !historyTextArea.isHidden {
                historyString += """
                    \(outputString)

                    """
                historyTextArea.text = historyString
            }
            
        } else {
            errorMsg.isHidden = false;
            errorMsg.text = "Please Enter valid expression"
        }
        
        
    }
    
    @IBAction func switchStandard(_ sender: Any) {
        let mode = (sender as! UIButton).tag
        if (mode == 0) {
            (sender as! UIButton).tag = 1
            (sender as! UIButton).setTitle("Standard - No History", for: .normal)
            
            historyTextArea.isHidden = false
        } else {
            (sender as! UIButton).tag = 0
            (sender as! UIButton).setTitle("Advance - With History", for: .normal)
            historyTextArea.isHidden = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

