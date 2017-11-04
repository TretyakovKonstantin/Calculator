//
//  Calculator.swift
//  CalculatorFourthHomework
//
//  Created by User on 26/10/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation

class Calculator {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func subtract(a: Int, b: Int) -> Int {
        return a - b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func divide(a: Int, b: Int) throws -> Int {
        guard b != 0 else {
            throw NSError()
        }
        return a / b
    }
    
    func operationStringRepresentation(a: Int, b: Int, operation: String, result: String) -> String{
        return "\(a) " + operation + " \(b) = " + result
    }
    
    enum stringOperations: String {
        case add = " + "
        case substract = " - "
        case multiply = " * "
        case divide = " / "
    }

}

