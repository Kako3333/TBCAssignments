//
//  OperationBtn.swift
//  newAssignment15
//
//  Created by Gio Kakaladze on 16.10.24.
//

import UIKit

class OperationBtn: UIButton {
    let icon: String
    var value: String
    
    init(icon: String, value: String? = nil) {
            self.icon = icon
            self.value = value ?? "" 
            super.init(frame: .zero)
            setupUI()
        }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 23, weight: .regular)
        let iconImage = UIImage(systemName: icon, withConfiguration: configuration)
        self.setImage(iconImage, for: .normal)
        
        
        self.imageView?.contentMode = .scaleAspectFit
        self.setTitle(nil, for: .normal)
        
        self.tintColor = .number
        self.backgroundColor = .systemGray5
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = self.bounds.width / 2
            self.clipsToBounds = true
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


