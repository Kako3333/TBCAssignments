//
//  PlanetCell.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 20.10.24.
//

protocol PlanetCellDelegate: AnyObject {
    func starButtonTapped(cell: PlanetCell)
}

import UIKit

class PlanetCell: UICollectionViewCell {
    
    static let identifier = "PlanetCell"
    weak var delegate: PlanetCellDelegate?
    
    
    private let planetImage: UIImageView = {
        let planetImage = UIImageView()
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetImage.contentMode = .scaleAspectFit
        return planetImage
    }()
    
    private let planetNameLabel: UILabel = {
        let planetName = UILabel()
        planetName.translatesAutoresizingMaskIntoConstraints = false
        return planetName
    }()
    
    private let planetAreaLabel: UILabel = {
        let planetArea = UILabel()
        planetArea.translatesAutoresizingMaskIntoConstraints = false
        return planetArea
    }()
    
    private let starButton: UIButton = {
        let starButton = UIButton()
        starButton.translatesAutoresizingMaskIntoConstraints = false
        return starButton
    }()
    
    private let view1: UIView = {
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    private func setupCellUI() {
        contentView.addSubview(view1)
        
        setupImage()
        setupNameLabel()
        setupAreaLabel()
        setupButton()
        setupView()
        configureButton()
    }
    
    private func setupView() {
        contentView.addSubview(view1)
        
        NSLayoutConstraint.activate([
            view1.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view1.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            view1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view1.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 5)
        ])
    }
    
    private func setupImage() {
        self.addSubview(planetImage)
        
        NSLayoutConstraint.activate([
            planetImage.widthAnchor.constraint(equalToConstant: 100),
            planetImage.heightAnchor.constraint(equalToConstant: 100),
            planetImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            planetImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupNameLabel() {
        view1.addSubview(planetNameLabel)
        planetNameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        planetNameLabel.textColor = .name
        
        NSLayoutConstraint.activate([
            planetNameLabel.topAnchor.constraint(equalTo: view1.topAnchor),
            planetNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 19)
        ])
    }
    
    private func setupAreaLabel() {
        view1.addSubview(planetAreaLabel)
        planetAreaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        planetAreaLabel.textColor = .name
        
        NSLayoutConstraint.activate([
            planetAreaLabel.topAnchor.constraint(equalTo: planetNameLabel.bottomAnchor, constant: 5),
            planetAreaLabel.centerXAnchor.constraint(equalTo: planetImage.centerXAnchor)
          
        ])
    }
    
    private func setupButton() {
        view1.addSubview(starButton)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.tintColor = .star
        starButton.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            starButton.leftAnchor.constraint(equalTo: planetNameLabel.rightAnchor, constant: 8),
            starButton.centerYAnchor.constraint(equalTo: planetNameLabel.centerYAnchor),
            starButton.widthAnchor.constraint(equalToConstant: 30),
            starButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureButton() {
        starButton.addAction(UIAction(handler: { [weak self] action in
            self?.starButtonTapped()
        }), for: .touchUpInside)
    }
    
    private func starButtonTapped() {
        delegate?.starButtonTapped(cell: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with planet: Planet) {
        planetNameLabel.text = planet.name
        planetAreaLabel.text = planet.area
        planetImage.image = UIImage(named: planet.image)
        
        starButton.tintColor = planet.isFavorite ? .yellow : .name
    }
    
    
    required init?(coder: NSCoder) {
        fatalError(":((((((((")
    }
}
