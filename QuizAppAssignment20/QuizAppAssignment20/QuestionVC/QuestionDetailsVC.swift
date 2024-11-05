//
//  QuestionDetailsVC.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 03.11.24.
//

import UIKit

class QuestionDetailsVC: UIViewController {
    
    var question: Question?
    
    let quizViewModel = MainPageViewModel()
    let defaults = UserDefaults.standard
    let mainVC = MainPageVC()
    
    private var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.numberOfLines = 0
        questionLabel.textColor = .white
        questionLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 24
        paragraphStyle.maximumLineHeight = 30
        
        let attributedText = NSAttributedString(
            string: "",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: questionLabel.font as Any
            ]
        )
        questionLabel.attributedText = attributedText
        return questionLabel
    }()
    
    private var questionCountLabel: UILabel = {
        let questionCountLabel = UILabel()
        questionCountLabel.layer.cornerRadius = 20
        questionCountLabel.layer.masksToBounds = true
        questionCountLabel.textColor = .white
        questionCountLabel.textAlignment = .center
        questionCountLabel.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
        questionCountLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        questionCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionCountLabel
    }()
    
    private func createAnswerButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 43/255.0, green: 0/255.0, blue: 99/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .leading
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        return button
    }
    
    private var answerbutton1: UIButton!
    private var answerbutton2: UIButton!
    private var answerbutton3: UIButton!
    private var answerbutton4: UIButton!
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    var correctAnswerLabel: UILabel = {
        let correctAnswerLabel = UILabel()
        correctAnswerLabel.layer.cornerRadius = 12
        correctAnswerLabel.layer.masksToBounds = true
        correctAnswerLabel.textColor = .white
        correctAnswerLabel.textAlignment = .center
        correctAnswerLabel.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
        correctAnswerLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 30
        correctAnswerLabel.attributedText = NSAttributedString(string: "Your Text Here", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return correctAnswerLabel
    }()
    
    var currentQuestionIndex = 0
    private var hasAnswered = false
    private var hasAnsweredCorrectly = false
    private var hasAnsweredIncorrectly = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupQuestionPageUI()
        setupInfo()
        setupButtonActions()
    }
    
    private func setupQuestionPageUI() {
        view.addSubview(questionLabel)
        answerbutton1 = createAnswerButton()
        answerbutton2 = createAnswerButton()
        answerbutton3 = createAnswerButton()
        answerbutton4 = createAnswerButton()
        view.addSubview(answerbutton1)
        view.addSubview(answerbutton2)
        view.addSubview(answerbutton3)
        view.addSubview(answerbutton4)
        view.addSubview(questionCountLabel)
        view.addSubview(backButton)
        view.addSubview(correctAnswerLabel)
        
        view.backgroundColor = UIColor(red: 12/255.0, green: 16/255.0, blue: 38/255.0, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            questionLabel.widthAnchor.constraint(equalToConstant: 240),
            questionLabel.heightAnchor.constraint(equalToConstant: 150),
            questionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            answerbutton1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            answerbutton1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            answerbutton1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            answerbutton1.heightAnchor.constraint(equalToConstant: 50),
            
            answerbutton2.topAnchor.constraint(equalTo: answerbutton1.bottomAnchor, constant: 10),
            answerbutton2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            answerbutton2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            answerbutton2.heightAnchor.constraint(equalToConstant: 50),
            
            answerbutton3.topAnchor.constraint(equalTo: answerbutton2.bottomAnchor, constant: 10),
            answerbutton3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            answerbutton3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            answerbutton3.heightAnchor.constraint(equalToConstant: 50),
            
            answerbutton4.topAnchor.constraint(equalTo: answerbutton3.bottomAnchor, constant: 10),
            answerbutton4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            answerbutton4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            answerbutton4.heightAnchor.constraint(equalToConstant: 50),
            
            correctAnswerLabel.heightAnchor.constraint(equalToConstant: 50  ),
            correctAnswerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            correctAnswerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            correctAnswerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            questionCountLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            questionCountLabel.widthAnchor.constraint(equalToConstant: 70),
            questionCountLabel.heightAnchor.constraint(equalToConstant: 40),
            questionCountLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
        backButton.addAction(UIAction(handler: { [weak self] action in
            self?.backButtonAction()
        }), for: .touchUpInside)
    }
    
    private func setupButtonActions() {
        answerbutton1.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        answerbutton2.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        answerbutton3.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        answerbutton4.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        guard !hasAnswered else { return }
        hasAnswered = true
        guard let correctAnswerText = question?.correctAnswer else { return }
        
        if sender.title(for: .normal) == correctAnswerText {
            sender.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            sender.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
            sender.setTitleColor(.white, for: .normal)
            updateCorrectAnswerCount()
            hasAnsweredCorrectly = true
            saveCorrectQuestion()
        } else {
            sender.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            sender.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
            sender.setTitleColor(.white, for: .normal)
            updateIncorrectAnswerCount()
            hasAnsweredIncorrectly = true
            saveWrongQuestion()
        }
        updateResultLabel()
    }
    
    private func saveCorrectQuestion() {
        defaults.set(hasAnsweredCorrectly, forKey: "hasAnsweredCorrectly_\(currentQuestionIndex)")
    }
   
    private func saveWrongQuestion() {
        defaults.set(hasAnsweredIncorrectly, forKey: "hasAnsweredIncorrectly_\(currentQuestionIndex)")
    }
    
    private func updateAnsweredPage() {
        hasAnsweredCorrectly = defaults.bool(forKey: "hasAnsweredCorrectly_\(currentQuestionIndex)")
        hasAnsweredIncorrectly = defaults.bool(forKey: "hasAnsweredIncorrectly_\(currentQuestionIndex)")
        if hasAnsweredCorrectly == true {
            setupCorrectlyAnsweredQuestion()
                print("Question already answered")
        } else if hasAnsweredIncorrectly == true {
            setupIncorrectlyAnsweredQuestion()
        }
    }
    
    private func setupCorrectlyAnsweredQuestion() {
        [answerbutton1, answerbutton2, answerbutton3, answerbutton4].forEach { button in
            button?.isEnabled = false
            if button?.title(for: .normal) == question?.correctAnswer {
                button?.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                button?.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
                button?.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    private func setupIncorrectlyAnsweredQuestion() {
        [answerbutton1, answerbutton2, answerbutton3, answerbutton4].forEach { button in
            button?.isEnabled = false
            if button?.title(for: .normal) == question?.incorrectAnswers[0] {
                button?.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                button?.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
                button?.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    private func updateResultLabel() {
        let  correctAnswerCount = defaults.integer(forKey: "correctAnswerCount")
        let  incorrectAnswerCount = defaults.integer(forKey: "incorrectAnswerCount")
        correctAnswerLabel.text = "Correct Answer \(correctAnswerCount) / Incorrect \(incorrectAnswerCount)"
    }
    
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateCorrectAnswerCount() {
        var currentCorrectAnswer = UserDefaults.standard.integer(forKey: "correctAnswerCount")
        currentCorrectAnswer += 1
        UserDefaults.standard.set(currentCorrectAnswer, forKey: "correctAnswerCount")
    }
    
    func updateIncorrectAnswerCount() {
        var currentIncorrectAnswerCount = UserDefaults.standard.integer(forKey: "incorrectAnswerCount")
        currentIncorrectAnswerCount += 1
        UserDefaults.standard.set(currentIncorrectAnswerCount, forKey: "incorrectAnswerCount")
    }
    
    private func setupInfo() {
        questionLabel.text = question?.question
        var answers = question?.incorrectAnswers ?? []
        if let correctAnswer = question?.correctAnswer {
            answers.append(correctAnswer)
        }
        answers.shuffle()
        answerbutton1.setTitle(answers[0], for: .normal)
        answerbutton2.setTitle(answers[1], for: .normal)
        answerbutton3.setTitle(answers[2], for: .normal)
        answerbutton4.setTitle(answers[3], for: .normal)
        
        questionCountLabel.text = "Question \(currentQuestionIndex)"
        updateResultLabel()
        updateAnsweredPage()
    }
}
