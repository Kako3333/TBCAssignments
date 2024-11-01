//
//  ViewController.swift
//  newAssignment15
//
//  Created by Gio Kakaladze on 16.10.24.
//

import UIKit
import SwiftUI

final class CalculatorController: UIViewController {
    
    private let gradient = CAGradientLayer()
    private let calculatorView = UIView()
    private var calculatorLogic: Calculate?
    private var resultVC: ResultPageVC?
    
    //Horiznral Stack
    private lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [verticalStack1, verticalStack2, verticalStack3, verticalStack4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .background
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    //VerticalStacks
    private lazy var verticalStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [darkModeBtn, sevenBtn, fourBtn, oneBtn, acButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [moduloBtn, eightBnt, fiveBtn, twoBtn, zeroBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [divisionBtn, nineBtn, sixBtn, threeBtn, dotButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack4: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [threeButtonStack, equalBtnStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var threeButtonStack: UIStackView = {
        let threeButtonStack = UIStackView(arrangedSubviews: [multiplyBtn, minusBtn, plusBtn])
        threeButtonStack.translatesAutoresizingMaskIntoConstraints = false
        threeButtonStack.backgroundColor = .background
        threeButtonStack.axis = .vertical
        threeButtonStack.distribution = .fillEqually
        threeButtonStack.spacing = 16
        return threeButtonStack
    }()
    
    private lazy var equalBtnStack: UIStackView = {
        let equalBtnStack = UIStackView(arrangedSubviews: [equalBtn])
        equalBtnStack.translatesAutoresizingMaskIntoConstraints = false
        equalBtnStack.backgroundColor = .background
        equalBtnStack.axis = .vertical
        equalBtnStack.distribution = .fillEqually
        equalBtnStack.spacing = 16
        return equalBtnStack
    }()
    
    // Labels
    private lazy var numbersLabel: UILabel = {
        let numbersLabel = UILabel()
        numbersLabel.text = "0"
        numbersLabel.textColor = UIColor.systemGray
        numbersLabel.font = UIFont.systemFont(ofSize: 20)
        numbersLabel.textAlignment = .right
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        return numbersLabel
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.textColor = UIColor.black
        resultLabel.font = UIFont.systemFont(ofSize: 47)
        resultLabel.textAlignment = .right
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
    //Buttons
    private let darkModeBtn = OperationBtn(icon: "moon")
    private let oneBtn = NumberBtn(number: "1")
    private let twoBtn = NumberBtn(number: "2")
    private let threeBtn = NumberBtn(number: "3")
    private let fourBtn = NumberBtn(number: "4")
    private let fiveBtn = NumberBtn(number: "5")
    private let sixBtn = NumberBtn(number:"6")
    private let sevenBtn = NumberBtn(number: "7")
    private let eightBnt = NumberBtn(number: "8")
    private let nineBtn = NumberBtn(number: "9")
    private let zeroBtn = NumberBtn(number: "0")
    private let divisionBtn = OperationBtn(icon: "divide", value: "/")
    private let multiplyBtn = OperationBtn(icon: "multiply", value: "*")
    private let minusBtn = OperationBtn(icon: "minus", value: "-")
    private let plusBtn = OperationBtn(icon: "plus", value: "+")
    private let equalBtn = OperationBtn(icon: "equal", value: "=")
    private let moduloBtn = OperationBtn(icon: "percent", value: "%")
    private let acButton = NumberBtn(number: "AC")
    private let dotButton = NumberBtn(number: ".")
    
    let resultNavBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        applyGradient()
        viewWillLayoutSubviews()
    }
    
    private func setupUI() {
        setupView()
        setupHorizontalStack()
        setupButtons()
        setupLabels()
        setupAndConfigureNavBtn()
        setupCalculatorLogic()
    }
    
    private func setupView() {
        view.addSubview(calculatorView)
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        calculatorView.backgroundColor = .background
        calculatorView.layer.cornerRadius = 30
        calculatorView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 200).isActive = true
        
        let maxWidth: CGFloat = 200
        calculatorView.heightAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
        calculatorView.heightAnchor.constraint(equalTo: calculatorView.widthAnchor, multiplier: 1.0).isActive = true
        
        let height: CGFloat = UIScreen.main.bounds.height < 568 ? 300 : 488
        calculatorView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        calculatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        calculatorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    private func setupHorizontalStack() {
        calculatorView.addSubview(horizontalStack)
        
        // CONSTRAINTS
        horizontalStack.leftAnchor.constraint(equalTo: calculatorView.leftAnchor, constant: 43).isActive = true
        horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: calculatorView.topAnchor, constant: 31).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: calculatorView.bottomAnchor, constant: -40).isActive = true
        equalBtn.heightAnchor.constraint(equalTo: threeButtonStack.heightAnchor, multiplier: 2 / 3).isActive = true
    }
    
    private func setupButtons() {
        // acButton
        let gradientTextColor = UIColor(red: 247/255, green: 60/255, blue: 87/255, alpha: 1)
        acButton.setTitle("AC", for: .normal)
        acButton.setAttributedTitle(NSAttributedString(string: acButton.title(for: .normal) ?? "", attributes: [NSAttributedString.Key.foregroundColor: gradientTextColor]), for: .normal)
        
        // lightDarkButton
        darkModeBtn.backgroundColor = .clear
        let opButtons = [moduloBtn, multiplyBtn, minusBtn, plusBtn, divisionBtn]
        for button in opButtons {
            button.backgroundColor = .clear
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemGray5.cgColor
        }
        darkModeBtn.layer.borderWidth = 2
        darkModeBtn.layer.borderColor = UIColor.systemGray5.cgColor
        let gradientTintColor = UIColor(red: 247/255, green: 60/255, blue: 87/255, alpha: 1)
        darkModeBtn.tintColor = gradientTintColor
        
        let buttonSize: CGFloat = 50
        
        let buttons = [darkModeBtn, oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBnt, nineBtn, zeroBtn, divisionBtn, multiplyBtn, minusBtn, plusBtn, moduloBtn, acButton, dotButton]
        
        for button in buttons {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
            button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
            button.layer.cornerRadius = buttonSize / 2
            button.clipsToBounds = true
        }
    }
    
    private func setupLabels() {
        view.addSubview(numbersLabel)
        view.addSubview(resultLabel)
        
        //NumLabelConstraints
        numbersLabel.heightAnchor.constraint(equalToConstant: 31).isActive = true
        numbersLabel.bottomAnchor.constraint(equalTo: calculatorView.topAnchor, constant: -120).isActive = true
        numbersLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        numbersLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        //ResultLabelConstraints
        resultLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: calculatorView.topAnchor, constant: -48).isActive = true
        
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.updateGradientFrame()
        }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientFrame()
    }
    
    private func updateGradientFrame() {
        gradient.frame = equalBtn.bounds
    }
    
    private func applyGradient() {
        let colorOne = UIColor(red: 237/255, green: 14/255, blue: 152/255, alpha: 1.0)
        let colorTwo = UIColor(red: 254/255, green: 90/255, blue: 46/255, alpha: 1.0)
        
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.cornerRadius = 30
        equalBtn.layer.insertSublayer(gradient, below: equalBtn.imageView?.layer)
        updateGradientFrame()
        equalBtn.tintColor = .white
    }
    
    
    
    //Setting up history navigation button
   private func setupAndConfigureNavBtn() {
        resultNavBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultNavBtn)
        let navBtnIcon = UIImage(systemName: "clock.arrow.circlepath")
        resultNavBtn.setImage(navBtnIcon, for: .normal)
        resultNavBtn.setTitle(nil, for: .normal)
        resultNavBtn.backgroundColor = .clear
        resultNavBtn.tintColor = .black
        
        resultNavBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        resultNavBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        resultNavBtn.widthAnchor.constraint(equalToConstant: 28).isActive = true
        resultNavBtn.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        //Action
        resultNavBtn.addAction(UIAction(handler: { [weak self] action in
            self?.navButtonAction()
        }), for: .touchUpInside)
    }
    
    
    private func setupCalculatorLogic() {
        let numberButtons = [oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBnt, nineBtn, zeroBtn, dotButton]
        let operationButtons = [plusBtn, minusBtn, multiplyBtn, divisionBtn, moduloBtn]
        let resetButton = acButton
        let equalsButton = equalBtn
        let numbersLabelCalculate = numbersLabel
        let resultsLabelCalculate = resultLabel
        calculatorLogic = Calculate(numberButtons: numberButtons, operationButtons: operationButtons, resetButton: resetButton, equalsButton: equalsButton, numbersLabel: numbersLabelCalculate, resultLabel: resultsLabelCalculate)
    }
    
    // NavBtn Action
    private func navButtonAction() {
           if resultVC == nil {
               resultVC = ResultPageVC()
               resultVC?.calculate = self.calculatorLogic
           }
           
           resultVC?.passData(exp: calculatorLogic!.expression, res: calculatorLogic!.result)
           self.navigationController?.pushViewController(resultVC!, animated: true)
       }
}



 
