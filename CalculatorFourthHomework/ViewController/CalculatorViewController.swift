//
//  CalculatorViewController.swift
//  CalculatorFourthHomework
//
//  Created by User on 26/10/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class CalcViewControllerView: UIView {
    
    var firstOperandTextField = UITextField()
    var secondOperandTextField = UITextField()
    var addButton = UIButton()
    var subtractButton = UIButton()
    var multiplyButton = UIButton()
    var divideButton = UIButton()
    
    private var infoLabel = UILabel()
    var calculatorGreetingLabel:UILabel = UILabel()
    var operationButtons:[UIButton]
    
    override var frame: CGRect {
        didSet {
            calculatorGreetingLabel.frame = CGRect(x:20, y:20, width:250, height:20)
            firstOperandTextField.frame = CGRect(x:20, y:60, width: 360, height: 40)
            secondOperandTextField.frame = CGRect(x:20, y:120, width: 360, height:40)
            addButton.frame = CGRect(x:20, y:180, width: 160, height: 40)
            subtractButton.frame = CGRect(x:220, y:180, width: 160, height: 40)
            multiplyButton.frame = CGRect(x:20, y:240, width: 160, height: 40)
            divideButton.frame = CGRect(x:220, y:240, width: 160, height: 40)
            infoLabel.frame = CGRect(x:20, y:300, width:360, height: 20)
        }
    }
    
    override init(frame: CGRect) {
        operationButtons = [addButton, subtractButton, multiplyButton, divideButton]
        super.init(frame: frame)
        addSubview(calculatorGreetingLabel)
        addSubview(firstOperandTextField)
        addSubview(secondOperandTextField)
        
        for button in operationButtons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            addSubview(button)
        }
        
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .red
        
        subtractButton.setTitle("-", for: .normal)
        subtractButton.backgroundColor = .blue
        
        multiplyButton.setTitle("*", for: .normal)
        multiplyButton.backgroundColor = .brown
        
        divideButton.setTitle("/", for: .normal)
        divideButton.backgroundColor = .green
        
        firstOperandTextField.borderStyle = UITextBorderStyle.roundedRect
        secondOperandTextField.borderStyle = UITextBorderStyle.roundedRect
        addSubview(infoLabel)
    }
    
    func setResultFields(result: Double, operationStr: String) {
        firstOperandTextField.text = String(result)
        infoLabel.text = operationStr
        secondOperandTextField.text = ""
    }
    
    func setProblemText(text: String) {
        infoLabel.text = text
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CalculatorViewController: UIViewController {
    var calcControllerView: CalcViewControllerView {
        get {
            return view as! CalcViewControllerView
        }
    }
    
    override func loadView() {
        view =  CalcViewControllerView()
        calcControllerView.addButton.addTarget(self, action: #selector(addButtonAction), for: .touchDown)
        calcControllerView.subtractButton.addTarget(self, action: #selector(subtractButtonAction), for: .touchDown)
        calcControllerView.multiplyButton.addTarget(self, action: #selector(multiplyButtonAction), for: .touchDown)
        calcControllerView.divideButton.addTarget(self, action: #selector(divideButtonAction), for: .touchDown)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        calcControllerView.calculatorGreetingLabel.text = "This is my calculator"
    }
    
    @objc func addButtonAction(sender: UIButton!) {
        calculateAndFillViewFields(operation: .add)
    }
    
    @objc func subtractButtonAction(sender: UIButton!) {
        calculateAndFillViewFields(operation: .subtract)
    }
    
    @objc func multiplyButtonAction(sender: UIButton!) {
        calculateAndFillViewFields(operation: .multiply)
    }
    
    @objc func divideButtonAction(sender: UIButton!) {
        guard Double(calcControllerView.secondOperandTextField.text!) != 0 else {
            calcControllerView.setProblemText(text: "Do not divide by zero")
            return
        }
        calculateAndFillViewFields(operation: .divide)
    }
    
    func calculateAndFillViewFields(operation: Calculator.stringOperations) {
        let firstOperand = Double(calcControllerView.firstOperandTextField.text!)
        let secondOperand = Double(calcControllerView.secondOperandTextField.text!)
        guard checkOperands(firstOperand: firstOperand, secondOperand: secondOperand) else {
            return
        }
        let result = Calculator.calculate(a: firstOperand!, b: secondOperand!, operation: operation)
        let operationStringRepresentation = Calculator.operationStringRepresentation(a: firstOperand!, b: secondOperand!, operation: .add, result: String(result))
        calcControllerView.setResultFields(result: result, operationStr: operationStringRepresentation)
    }
    
    func checkOperands(firstOperand: Double?, secondOperand: Double?) -> Bool{
        guard firstOperand != nil && secondOperand != nil else {
            calcControllerView.setProblemText(text: "Please, fill text fields with proper numbers")
            return false
        }
        return true
    }
}
