//
//  ViewController.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var isChosen = false
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerLabel.textColor = .white
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemRed
        view.addSubview(headerLabel)
        setupButtons()
        headerLabel.text = isChosen ? "You have chosen ... category" : "Choose a category"
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300)
        ])
    }
    
    private func setupButtons() {
        //დაშორებამ არ დაგაბნიოთ მეც დავიბენი თავიდან თურმე ემოჯები შვრება ;D
        let movieButton = makeButton(title: "🎥 Movies 🎬")
        let animeButton = makeButton(title: "🌸 Anime 🎌")
        let bookButton = makeButton(title: "📚 Books 📖")
        let gameButton = makeButton(title: "🎮 Games 🕹️")
        
        let firstStack = UIStackView(arrangedSubviews: [movieButton, animeButton])
        firstStack.axis = .vertical
        firstStack.spacing = 20
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStack = UIStackView(arrangedSubviews: [bookButton, gameButton])
        secondStack.axis = .vertical
        secondStack.spacing = 20
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        
        let categoriesStack = UIStackView(arrangedSubviews: [firstStack, secondStack])
        categoriesStack.axis = .horizontal
        categoriesStack.alignment = .center
        categoriesStack.distribution = .fillEqually
        categoriesStack.spacing = 40
        categoriesStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(categoriesStack)
        
        NSLayoutConstraint.activate([
            categoriesStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoriesStack.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 50),
            categoriesStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        movieButton.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
        animeButton.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
        bookButton.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
        gameButton.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func makeButton(title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }
    
    @objc private func categoryButtonTapped(_ sender: UIButton) {
        guard let categoryTitle = sender.title(for: .normal) else { return }
        
        let questionVC = QuestionsViewController()
        questionVC.categoryName = categoryTitle
        
        switch categoryTitle {
        case "🎥 Movies 🎬":
            questionVC.selectedCategory = moviesCategory.riddles
            questionVC.categoryName = "Movie"
        case "🌸 Anime 🎌":
            questionVC.selectedCategory = animeCategory.riddles
            questionVC.categoryName = "Anime"
        case "📚 Books 📖":
            questionVC.selectedCategory = booksCategory.riddles
            questionVC.categoryName = "Book"
        case "🎮 Games 🕹️":
            questionVC.selectedCategory = gamesCategory.riddles
            questionVC.categoryName = "Video Games"
        default:
            print("arvici")
        }
        navigationController?.pushViewController(questionVC, animated: true)
    }
}

