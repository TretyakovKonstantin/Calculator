//
//  Calculator.swift
//  CalculatorFourthHomework
//
//  Created by User on 26/10/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation

class Calculator {
   
    static func calculate(a: Double, b: Double, operation: stringOperations) -> Double {
        switch operation {
            case .add:
                return a + b
            case .subtract:
                return a - b
            case .multiply:
                return a * b
            case .divide:
                return a / b
        }
    }
    
    static func operationStringRepresentation(a: Double, b: Double, operation: stringOperations, result: String) -> String{
        return "\(a) " + operation.rawValue + " \(b) = " + result
    }
    
    enum stringOperations: String {
        case add = " + "
        case subtract = " - "
        case multiply = " * "
        case divide = " / "
    }

}

