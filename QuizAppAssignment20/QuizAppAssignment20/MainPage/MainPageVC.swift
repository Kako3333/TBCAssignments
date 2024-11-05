//
//  QuizVC.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 02.11.24.
//

import UIKit

class MainPageVC: UIViewController {
    
    var questions: [Question] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let quizLabel: UILabel = {
        let quizLabel = UILabel()
        quizLabel.text = "Quiz"
        quizLabel.textColor = .white
        quizLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        return quizLabel
    }()
    
    private let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.layer.cornerRadius = 20
        resetButton.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        return resetButton
    }()
    
    private var quizResponse: QuizResponse?
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let correctAnswer = "correctAnswer"
        static let incorrectAnswer = "incorrectAnswer"
    }
    
    var correctAnswer = 0
    var incorrectAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAndLabel()
        setupTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 12/255.0, green: 16/255.0, blue: 38/255.0, alpha: 1.0)
        view.backgroundColor = UIColor(red: 12/255.0, green: 16/255.0, blue: 38/255.0, alpha: 1.0)
        
        let jsonManager = MainPageViewModel()
        quizResponse = jsonManager.decodeQuizData(from: "Question")
        
        if let quizResponse = jsonManager.decodeQuizData(from: "Question") {
            print("Number of questions: \(quizResponse.results.count)")
            for question in quizResponse.results {
                print("Question: \(question.question), Correct Answer: \(question.correctAnswer)")
            }
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupButtonAndLabel() {
        view.addSubview(quizLabel)
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            quizLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            quizLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            resetButton.widthAnchor.constraint(equalToConstant: 70),
            resetButton.heightAnchor.constraint(equalToConstant: 40),
            resetButton.centerYAnchor.constraint(equalTo: quizLabel.centerYAnchor)
        ])
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
    }
    
    @objc private func resetButtonPressed() {
            defaults.set(0, forKey: "incorrectAnswerCount")
            defaults.set(0, forKey: "correctAnswerCount")
         
        if let quizResponse = quizResponse {
                for (index, _) in quizResponse.results.enumerated() {
                    defaults.set(false, forKey: "hasAnsweredCorrectly_\(index + 1)")
                }
            }
        
        if let quizResponse = quizResponse {
                for (index, _) in quizResponse.results.enumerated() {
                    defaults.set(false, forKey: "hasAnsweredIncorrectly_\(index + 1)")
                }
            }
            
            let alert = UIAlertController(title: "Reset", message: "correctAnswerount and incorrectAnswerCount have been resetd", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
}

extension MainPageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizResponse?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError(":(((((((")
        }
        
        if let quizResponse = quizResponse {
            _ = quizResponse.results[indexPath.row]
            cell.questionButton.setTitle("Question \(indexPath.row + 1)", for: .normal)
        }
    
        cell.buttonTappedAction = { [weak self] in
                guard let self = self else { return }
                
                let questionDetailsVC = QuestionDetailsVC()
                questionDetailsVC.question = self.quizResponse?.results[indexPath.row]
                questionDetailsVC.currentQuestionIndex = (indexPath.row + 1)
                self.navigationController?.pushViewController(questionDetailsVC, animated: true)
            }
        return cell
    }
}

