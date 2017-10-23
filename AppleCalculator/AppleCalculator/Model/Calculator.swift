//
//  Calculator.swift
//  AppleCalculator
//
//  Created by Korman Chen on 10/22/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation

class Calculator {
    var operand1 : String
    var operand2 : String
    var op : String
    
    init() {
        operand1 = ""
        operand2 = ""
        op = ""
    }
    
    func compute() -> String? {
        guard !op.isEmpty else {
            return nil
        }
        
        guard !operand1.isEmpty else {
            return nil
        }
        
        guard !operand2.isEmpty else {
            return nil
        }
        
        if op == "*" {
            operand1 = String(Int(operand1)! * Int(operand2)!)
            operand2 = ""
        }
        else if op == "/" {
            operand1 = String(Int(operand1)! / Int(operand2)!)
            operand2 = ""
        }
        else if op == "+" {
            operand1 = String(Int(operand1)! + Int(operand2)!)
            operand2 = ""
        }
        else {
            operand1 = String(Int(operand1)! - Int(operand2)!)
            operand2 = ""
        }
        
        return operand1
    }
    
    func clear() {
        operand1 = ""
        operand2 = ""
        op = ""
    }
}
