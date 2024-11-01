//
//  PlanetCell.swift
//  Assignment16.Planets
//
//  Created by Gio Kakaladze on 18.10.24.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    private var vc = PlanetDetailsVC?.self
    static let identifier = "PlanetCell"
    
    private let planetImage: UIImageView = {
        let planetImage = UIImageView()
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        return planetImage
    }()
    
    private let planetNameLabel: UILabel = {
        let planetNameLabel = UILabel()
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return planetNameLabel
    }()
    
    private let planetAreaLabel: UILabel = {
        let planetArea = UILabel()
        planetArea.translatesAutoresizingMaskIntoConstraints = false
        return planetArea
    }()
    
    private let detailsNavButton: UIButton = {
        let detailsNavButton = UIButton(type: .system)
        detailsNavButton.setImage(UIImage(named: "navigateBtn"), for: .normal)
        detailsNavButton.tintColor = UIColor(resource: .header)
        detailsNavButton.translatesAutoresizingMaskIntoConstraints = false
        return detailsNavButton
    }()
    
    var detailButtonPressed: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        contentView.addSubview(planetImage)
        contentView.addSubview(planetAreaLabel)
        contentView.addSubview(planetNameLabel)
        
        setupPlanetImage()
        setupPlanetNameLabel()
        setupPlanetAreaLabel()
        setupDetailButton()
        configureButton()
    }
    
    private func setupPlanetImage() {
        planetImage.layer.cornerRadius = 50
        planetImage.backgroundColor = .clear
        planetImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            planetImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            planetImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            planetImage.widthAnchor.constraint(equalToConstant: 100),
            planetImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupPlanetNameLabel() {
        planetNameLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        planetNameLabel.textColor = .nameLabel
        
        NSLayoutConstraint.activate([
            planetNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            planetNameLabel.leftAnchor.constraint(equalTo: planetImage.leftAnchor, constant: 153),
        ])
    }
    
    private func setupPlanetAreaLabel() {
        planetAreaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        planetAreaLabel.textColor = .nameLabel
        
        NSLayoutConstraint.activate([
            planetAreaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 8),
            planetAreaLabel.leadingAnchor.constraint(equalTo: planetNameLabel.leadingAnchor)
        ])
    }
    
    private func setupDetailButton() {
        contentView.addSubview(detailsNavButton)
        NSLayoutConstraint.activate([
            detailsNavButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailsNavButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func configureButton() {
        detailsNavButton.addAction(UIAction(handler: { [weak self] action in
            self?.detailButtonTapped()
        }), for: .touchUpInside)
    }
    
    private func detailButtonTapped() {
        detailButtonPressed?()
    }
    
    func configure(with planet: (name: String, imageName: String, area: String, temperature: String, mass: String)) {
        planetNameLabel.text = planet.name
        planetAreaLabel.text = planet.area
        planetImage.image = UIImage(named: planet.imageName)
    }
}

#Preview {
    PlanetCell()
}
