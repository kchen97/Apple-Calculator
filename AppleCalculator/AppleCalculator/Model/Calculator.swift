//
//  Calculator.swift
//  AppleCalculator
//
//  Created by Korman Chen on 10/22/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation

enum CalculatorState {
    case onOperator1
    case onOperator2
}

class Calculator {
    var operand1 : String?
    var operand2 : String?
    var op : String?
    var state : CalculatorState
    
    init() {
        operand1 = ""
        operand2 = ""
        op = ""
        state = .onOperator1
    }
    
    func compute() -> String? {
        
        if let oper1 = operand1, let op = op {
            if op == "%" {
                return String(Float(oper1)! / 100)
            }
        }
        
        if let oper1 = operand1, let oper2 = operand2, let op = op {
            if op == "*" {
                operand1 = String(Float(oper1)! * Float(oper2)!)
                operand2 = nil
            }
            else if op == "/" {
                operand1 = String(Float(oper1)! / Float(oper2)!)
                operand2 = nil
            }
            else if op == "+" {
                operand1 = String(Float(oper1)! + Float(oper2)!)
                operand2 = nil
            }
            else {
                operand1 = String(Float(oper1)! - Float(oper2)!)
                operand2 = nil
            }
        }
        else {
            return nil
        }
        
        return operand1
    }
    
    func clear() {
        operand1 = nil
        operand2 = nil
        op = nil
        state = .onOperator1
    }
}
