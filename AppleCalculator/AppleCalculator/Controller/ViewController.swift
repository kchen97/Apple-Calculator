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
    private var calculator = Calculator()
    @IBOutlet weak var displayLabel: UILabel!
    var currentTextDisplayed : String = ""
    
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
            if calculator.op.isEmpty {
                calculator.operand1.append(String(sender.tag))
                currentTextDisplayed = calculator.operand1
            }
            else {
                calculator.operand2.append(String(sender.tag))
                currentTextDisplayed = calculator.operand2
            }
        }
        else if sender.tag == 18 {
            reset()
            return
        }
        else if sender.tag == 15 {
            calculator.op = "/"
        }
        else if sender.tag == 14 {
            calculator.op = "*"
        }
        else if sender.tag == 13 {
            calculator.op = "-"
        }
        else if sender.tag == 12 {
            calculator.op = "+"
        }
        else if sender.tag == 11 {
            guard let text = calculator.compute() else {
                return
            }
            currentTextDisplayed = text
        }
        
        updateUI()
    }
    
    func updateUI() {
        displayLabel.text = currentTextDisplayed
    }
    
    func reset() {
        currentTextDisplayed.removeAll()
        calculator.clear()
        updateUI()
    }
}

