//
//  TableViewCell.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 03.11.24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "QuestionCell"
    
    var questionButton: UIButton = {
        let questionButton = UIButton()
        questionButton.layer.cornerRadius = 15
        questionButton.backgroundColor = .white
        questionButton.setTitleColor(UIColor(red: 43/255.0, green: 0/255.0, blue: 99/255.0, alpha: 1.0), for: .normal)
        questionButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        return questionButton
    }()
    
    var buttonTappedAction: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        questionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        selectionStyle = .none
        setupCell()
    }
    
    private func setupCell() {
            contentView.addSubview(questionButton)
            contentView.backgroundColor = UIColor(red: 12/255.0, green: 16/255.0, blue: 38/255.0, alpha: 1.0)
            
            NSLayoutConstraint.activate([
                questionButton.heightAnchor.constraint(equalToConstant: 41),
                questionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                questionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
                questionButton.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                questionButton.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ])
        }
    
    @objc private func buttonTapped() {
            buttonTappedAction?()
        }

    required init?(coder: NSCoder) {
        fatalError(":(((((")
    }
}
