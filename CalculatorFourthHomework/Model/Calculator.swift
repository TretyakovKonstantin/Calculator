//
//  Calculator.swift
//  CalculatorFourthHomework
//
//  Created by User on 26/10/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation

class Calculator {
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func subtract(a: Double, b: Double) -> Double {
        return a - b
    }
    
    func multiply(a: Double, b: Double) -> Double {
        return a * b
    }
    
    func divide(a: Double, b: Double) throws -> Double {
        guard b != 0 else {
            throw NSError()
        }
        return a / b
    }
    
    func operationStringRepresentation(a: Double, b: Double, operation: String, result: String) -> String{
        return "\(a) " + operation + " \(b) = " + result
    }
    
    enum stringOperations: String {
        case add = " + "
        case substract = " - "
        case multiply = " * "
        case divide = " / "
    }

}

