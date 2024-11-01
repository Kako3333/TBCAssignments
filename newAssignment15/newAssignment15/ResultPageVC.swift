//
//  ResultPageVC.swift
//  newAssignment15
//
//  Created by Gio Kakaladze on 16.10.24.
//
//

import UIKit
import SwiftUI

class ResultPageVC: UIViewController, passDataDelegate {
    
    private let backButton = UIButton()
    let historyTextView = UITextView()
    let storedHistory = UITextView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        setupAndConfigureBackBtn()
        setupHistoryTextView()
        setupStoredHistory()
    }
    
    var calculate: Calculate?

    
    
    func passData(exp: String, res: String) {
        if !exp.isEmpty && !res.isEmpty {
               let formattedText = "\(exp) = \(res)"
               historyTextView.text = formattedText
           } else {
               historyTextView.text = exp 
           }
    }
    
    
    
    private func setupAndConfigureBackBtn() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        let backBtnIcon = UIImage(systemName: "arrowshape.backward.circle")
        backButton.setImage(backBtnIcon, for: .normal)
        backButton.setTitle(nil, for: .normal)
        backButton.backgroundColor = .clear
        backButton.tintColor = .black
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        // Action
        backButton.addAction(UIAction(handler: { [weak self] action in
            self?.backButtonAction()
        }), for: .touchUpInside)
    }
    
    private func backButtonAction() {
        if let currentText = historyTextView.text, !currentText.isEmpty {
               let existingHistory = storedHistory.text ?? ""
               
               if !existingHistory.contains(currentText) {
                   storedHistory.text = existingHistory + (existingHistory.isEmpty ? "" : "\n") + currentText
               }
               historyTextView.text = ""
           }
           self.navigationController?.popViewController(animated: true)
       }
    
    private func setupHistoryTextView() {
        historyTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyTextView)
        historyTextView.isEditable = false
        historyTextView.font = UIFont.systemFont(ofSize: 20)
        historyTextView.textColor = .black
        historyTextView.textAlignment = .right
        historyTextView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            historyTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            historyTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            historyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            historyTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupStoredHistory() {
        view.addSubview(storedHistory)
        storedHistory.translatesAutoresizingMaskIntoConstraints = false
        storedHistory.font = UIFont.systemFont(ofSize: 20)
        storedHistory.textColor = .black
        storedHistory.textAlignment = .right
        storedHistory.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
                storedHistory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                storedHistory.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                storedHistory.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                storedHistory.bottomAnchor.constraint(equalTo: historyTextView.topAnchor, constant: -20),
                storedHistory.heightAnchor.constraint(equalToConstant: 150)
            ])
       
    }
    

}

