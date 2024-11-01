//
//  Buttons.swift
//  Assignment13
//
//  Created by Gio Kakaladze on 13.10.24.
//

import UIKit

class NumberBtn: UIButton {
    let number: String
    
    init(number: String) {
        self.number = number
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        
        self.setTitle(number, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        self.backgroundColor = .clear
        self.setTitleColor(.numberColor, for: .normal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
