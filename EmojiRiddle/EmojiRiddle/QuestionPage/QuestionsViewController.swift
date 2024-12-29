//
//  QuestionsViewController.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import UIKit
import SwiftUI

class QuestionsViewController: UIViewController {
    
    var categoryName: String?
    var selectedCategory: [Riddle] = []
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerLabel.numberOfLines = 0
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupUI()
        setupBackButtonAction()
        setupRiddleView()
    }
    
    private func setupUI() {
        view.addSubview(headerLabel)
        view.addSubview(backButton)
        
        headerLabel.text = """
                         You have chosen
                      \(categoryName!) category
                      """
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            headerLabel.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -10),
            
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupRiddleView() {
        if !selectedCategory.isEmpty {
            let riddleView = RiddleView(riddles: selectedCategory, category: categoryName!)
            let hostingController = UIHostingController(rootView: riddleView)
            
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
                hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            
            hostingController.didMove(toParent: self)
        }
    }
    
    private func setupBackButtonAction() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

