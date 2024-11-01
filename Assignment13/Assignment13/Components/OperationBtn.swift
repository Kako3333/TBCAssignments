//
//  OperationBtn.swift
//  Assignment13
//
//  Created by Gio Kakaladze on 13.10.24.
//

import UIKit

class OperationBtn: UIButton {
    let icon: String
    
    init(icon: String) {
        self.icon = icon
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
        
        self.tintColor = .numberColor
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
