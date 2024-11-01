//
//  PlanetsHeader.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 21.10.24.
//

import UIKit

class PlanetsHeader: UICollectionReusableView {
    
    static let identifier = "PlanetsHeader"
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "Planets"
        headerLabel.font = .systemFont(ofSize: 36, weight: .bold)
        headerLabel.textColor = .name
        headerLabel.textAlignment = .center
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    public func configure() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        headerLabel.frame = bounds
    }
}
