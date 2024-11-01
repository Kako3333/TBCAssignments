//
//  Calculate.swift
//  newAssignment15
//
//  Created by Gio Kakaladze on 16.10.24.
//

import UIKit

protocol passDataDelegate {
    func passData(exp: String, res: String)
}

class Calculate {
    
    var expression = ""
    var result = ""
    var delegate: passDataDelegate?
    
    
    private var numberButtons: [UIButton] = []
    private var operationButtons: [UIButton] = []
    private var resetButton: UIButton?
    private var equalsButton: UIButton?
    private var numbersLabel: UILabel?
    private var resultLabel: UILabel?
    
    private var resultPage: ResultPageVC?
    
    
    init(numberButtons: [UIButton], operationButtons: [UIButton], resetButton: UIButton, equalsButton: UIButton, numbersLabel: UILabel, resultLabel: UILabel) {
        self.numberButtons = numberButtons
        self.operationButtons = operationButtons
        self.resetButton = resetButton
        self.equalsButton = equalsButton
        self.numbersLabel = numbersLabel
        self.resultLabel = resultLabel
        setupButtonActions()
    }
    
    private func setupButtonActions() {
        for button in numberButtons {
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.numberButtonPressed(button.title(for: .normal) ?? "")
            }), for: .touchUpInside)
        }
        
        for button in operationButtons {
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.operationButtonPressed((button as? OperationBtn)?.value ?? "")
            }), for: .touchUpInside)
        }
        
        if let acButton = resetButton {
            acButton.addAction(UIAction(handler: { [weak self] _ in
                self?.resetCalculator()
            }), for: .touchUpInside)
        }
        
        if let equalsButton = equalsButton {
            equalsButton.addAction(UIAction(handler: { [weak self] _ in
                self?.equalButtonTapped()
            }), for: .touchUpInside)
        }
    }
    
    private func numberButtonPressed(_ number: String) {
        expression += number
        updateNumbersLabel()
    }
    
    private func operationButtonPressed(_ operation: String) {
        if !expression.isEmpty, "+-*/%".contains(expression.last!) == false {
            expression += operation
            updateNumbersLabel()
        }
    }
    
    private func equalButtonTapped() {
        let exp = NSExpression(format: expression)
        if let resultValue = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            result = "\(resultValue)"
            updateResultLabel()
        }  else {
            result = "Error"
            updateResultLabel()
        }
    }


    private func resetCalculator() {
        expression = ""
        result = ""
        updateNumbersLabel()
        updateResultLabel()
    }
    
    private func updateNumbersLabel() {
        numbersLabel?.text = expression
    }
    
    private func updateResultLabel() {
        resultLabel?.text = result
    }
    
    
}

