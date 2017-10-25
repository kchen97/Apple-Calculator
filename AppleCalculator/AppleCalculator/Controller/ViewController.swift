//
//  ViewController.swift
//  AppleCalculator
//
//  Created by Korman Chen on 10/22/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    let dictOfOps = [15 : "/", 14: "*", 13 : "-", 12 : "+"]
    private var calculator = Calculator()
    @IBOutlet weak var displayLabel: UILabel!
    var currentTextDisplayed : String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            addToOperand(state: calculator.state, value: sender.tag)
        }
        else if sender.tag == 18 {
            reset()
            return
        }
        else if sender.tag == 16 {
            calculator.op = "%"
            if let result = calculator.compute() {
                currentTextDisplayed = result
            }
        }
        else if sender.tag <= 15 && sender.tag >= 12 {
            if calculator.state == .onOperator1 {
                calculator.op = dictOfOps[sender.tag]
                calculator.state = .onOperator2
            }
            else {
                if let result = calculator.compute() {
                    currentTextDisplayed = result
                }
                calculator.op = dictOfOps[sender.tag]
            }
        }
        else if sender.tag == 11 {
            guard let text = calculator.compute() else {
                return
            }
            currentTextDisplayed = text
        }
        
        updateUI()
    }
    
    func addToOperand(state: CalculatorState, value: Int) {
        if state == .onOperator1 {
            if calculator.operand1 == nil {
                calculator.operand1 = String(value)
            }
            else {
                calculator.operand1?.append(String(value))
            }
            currentTextDisplayed = calculator.operand1!
        }
        else {
            if calculator.operand2 == nil {
                calculator.operand2 = String(value)
            }
            else {
                calculator.operand2?.append(String(value))
            }
            currentTextDisplayed = calculator.operand2!
        }
    }
    
    func updateUI() {
        displayLabel.text = currentTextDisplayed
    }
    
    func reset() {
        currentTextDisplayed = "0"
        calculator.clear()
        updateUI()
    }
}

