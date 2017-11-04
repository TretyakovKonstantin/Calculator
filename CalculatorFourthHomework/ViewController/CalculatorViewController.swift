//
//  CalculatorViewController.swift
//  CalculatorFourthHomework
//
//  Created by User on 26/10/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class CalcViewControllerView: UIView {
    
    var calculatorGreetingLabel:UILabel = UILabel()
    
    var firstOperandTextField = UITextField()
    var secondOperandTextField = UITextField()
    
    var plusButton = UIButton()
    var subtractButton = UIButton()
    var multiplyButton = UIButton()
    var divideButton = UIButton()
    
    var problemLabel = UILabel()
    
    var calculator = Calculator()
    
    var operationButtons:[UIButton]
    
    override var frame: CGRect {
        didSet {
            calculatorGreetingLabel.frame = CGRect(x:20, y:20, width:250, height:20)
            firstOperandTextField.frame = CGRect(x:20, y:60, width: 360, height: 40)
            secondOperandTextField.frame = CGRect(x:20, y:120, width: 360, height:40)
            plusButton.frame = CGRect(x:20, y:180, width: 160, height: 40)
            subtractButton.frame = CGRect(x:220, y:180, width: 160, height: 40)
            multiplyButton.frame = CGRect(x:20, y:240, width: 160, height: 40)
            divideButton.frame = CGRect(x:220, y:240, width: 160, height: 40)
            problemLabel.frame = CGRect(x:20, y:300, width:360, height: 20)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        operationButtons = [plusButton, subtractButton, multiplyButton, divideButton]
        addSubview(calculatorGreetingLabel)
        addSubview(firstOperandTextField)
        addSubview(secondOperandTextField)
        
        for button in operationButtons! {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.addTarget(self, action: #selector(operationButtonAction), for: .touchDown)
            addSubview(button)
        }
        
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .red
        
        subtractButton.setTitle("-", for: .normal)
        subtractButton.backgroundColor = .blue
        
        multiplyButton.setTitle("*", for: .normal)
        multiplyButton.backgroundColor = .brown
        
        divideButton.setTitle("/", for: .normal)
        divideButton.backgroundColor = .green
        
        firstOperandTextField.borderStyle = UITextBorderStyle.roundedRect
        secondOperandTextField.borderStyle = UITextBorderStyle.roundedRect
        addSubview(problemLabel)
    }
    
    @objc func operationButtonAction(sender: UIButton!) {
        var result: String
        let firstOperand = Int(firstOperandTextField.text!)
        let secondOperand = Int(secondOperandTextField.text!)
        
        print("\(firstOperand) \(secondOperand)")
        guard firstOperand != nil && secondOperand != nil else {
            problemLabel.text = "Please, fill text fields with proper numbers"
            return
        }
        
        secondOperandTextField.text = ""
        switch sender.titleLabel?.text {
        case "+"?:
            result = String(calculator.add(a: firstOperand!, b: secondOperand!))
        case "-"?:
            result = String(calculator.subtract(a: firstOperand!, b: secondOperand!))
        case "*"?:
            result = String(calculator.multiply(a: firstOperand!, b: secondOperand!))
        case "/"?:
            do {
                try result = String(calculator.divide(a: firstOperand!, b: secondOperand!))
            } catch {
                problemLabel.text = "DO NOT divide by zero"
                return
            }
            
        default:
            problemLabel.text = "Operation was not found. Try again"
            return
        }
        
        firstOperandTextField.text = String(result)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CalculatorViewController: UIViewController {
    var calculator = Calculator()
    var calcControlerView: CalcViewControllerView {
        get {
            return view as! CalcViewControllerView
        }
    }
    
    override func loadView() {
        view =  CalcViewControllerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        calcControlerView.calculatorGreetingLabel.text = "This is my calculator"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
