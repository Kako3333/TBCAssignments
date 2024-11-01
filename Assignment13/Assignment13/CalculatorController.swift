//
//  ViewController.swift
//  Assignment13
//
//  Created by Gio Kakaladze on 13.10.24.
//

import UIKit
import SwiftUI



final class CalculatorController: UIViewController {
    
    let view1 = UIView()
    private lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [verticalStack1, verticalStack2, verticalStack3, verticalStack4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundColor
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    // VerticalStacks
    private lazy var verticalStack1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [darkModeBtn, sevenBtn, fourBtn, oneBtn, acButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundColor
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [moduloBtn, eightBnt, fiveBtn, twoBtn, zeroBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundColor
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [divisionBtn, nineBtn, sixBtn, threeBtn, dotButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundColor
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var verticalStack4: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [threeButtonStack, equalBtnStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .backgroundColor
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var threeButtonStack: UIStackView = {
        let threeButtonStack = UIStackView(arrangedSubviews: [multiplyBtn, minusBtn, plusBtn])
        threeButtonStack.translatesAutoresizingMaskIntoConstraints = false
        threeButtonStack.backgroundColor = .backgroundColor
        threeButtonStack.axis = .vertical
        threeButtonStack.distribution = .fillEqually
        threeButtonStack.spacing = 16
        return threeButtonStack
    }()
    
    private lazy var equalBtnStack: UIStackView = {
        let equalBtnStack = UIStackView(arrangedSubviews: [equalBtn])
        equalBtnStack.translatesAutoresizingMaskIntoConstraints = false
        equalBtnStack.backgroundColor = .backgroundColor
        equalBtnStack.axis = .vertical
        equalBtnStack.distribution = .fillEqually
        equalBtnStack.spacing = 16
        return equalBtnStack
    }()
    
    
    // Labels
    private lazy var numbersLabel: UILabel = {
        let numbersLabel = UILabel()
        numbersLabel.text = "120 x 3 + 608 + 1080"
        numbersLabel.textColor = UIColor.systemGray
        numbersLabel.font = UIFont.systemFont(ofSize: 20)
        numbersLabel.textAlignment = .center
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        return numbersLabel
    }()
    
    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "2,048"
        resultLabel.textColor = UIColor.black
        resultLabel.font = UIFont.systemFont(ofSize: 47)
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
    private let gradient = CAGradientLayer()
    // Buttons
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
    private let divisionBtn = OperationBtn(icon: "divide")
    private let multiplyBtn = OperationBtn(icon: "multiply")
    private let minusBtn = OperationBtn(icon: "minus")
    private let plusBtn = OperationBtn(icon: "plus")
    private let equalBtn = OperationBtn(icon: "equal")
    private let moduloBtn = OperationBtn(icon: "percent")
    private let acButton = NumberBtn(number: "AC")
    private let dotButton = NumberBtn(number: ".")
    
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
    }
    
    private func setupView() {
        view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .backgroundColor
        view1.layer.cornerRadius = 30
        
        view1.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 200).isActive = true

        let maxWidth: CGFloat = 200
        view1.heightAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
        view1.heightAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 1.0).isActive = true
        
        let height: CGFloat = UIScreen.main.bounds.height < 568 ? 300 : 488
            view1.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        view1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        view1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
}
    
    private func setupHorizontalStack() {
        view1.addSubview(horizontalStack)
        
        // CONSTRAINTS
        horizontalStack.leftAnchor.constraint(equalTo: view1.leftAnchor, constant: 43).isActive = true
        horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: view1.topAnchor, constant: 31).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -40).isActive = true
        equalBtn.heightAnchor.constraint(equalTo: threeButtonStack.heightAnchor, multiplier: 2 / 3).isActive = true
       
    }

    
    private func setupButtons() {
        // acButton
        let gradientTextColor = UIColor(red: 247/255, green: 60/255, blue: 87/255, alpha: 1)
        acButton.setTitle("AC", for: .normal)
        acButton.setAttributedTitle(NSAttributedString(string: acButton.title(for: .normal) ?? "", attributes: [NSAttributedString.Key.foregroundColor: gradientTextColor]), for: .normal)
        
        // lightDarkButton
        darkModeBtn.backgroundColor = .clear
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

        numbersLabel.widthAnchor.constraint(equalToConstant: 193).isActive = true
        numbersLabel.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        numbersLabel.bottomAnchor.constraint(equalTo: view1.topAnchor, constant: -120).isActive = true
        numbersLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43).isActive = true
        
        resultLabel.widthAnchor.constraint(equalToConstant: 124).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        resultLabel.bottomAnchor.constraint(equalTo: view1.topAnchor, constant: -48).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -43).isActive = true
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
}

#Preview {
    CalculatorController()
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
    
