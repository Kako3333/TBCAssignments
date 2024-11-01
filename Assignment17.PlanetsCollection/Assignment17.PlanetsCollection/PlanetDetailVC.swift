//
//  PlanetDetailVC.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 21.10.24.
//

import UIKit

protocol funcFromDetail {
    func didUpdateFavoriteStatus(planet: Planet)
}

class PlanetDetailsVC: UIViewController {
    
    var planet: Planet?
    var delegate: funcFromDetail?
    
    private let planetDetailImage: UIImageView = {
        let planetDetailImage = UIImageView()
        planetDetailImage.translatesAutoresizingMaskIntoConstraints = false
        planetDetailImage.contentMode = .scaleAspectFit
        return planetDetailImage
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .name
        return label
    }()
    
    private let areaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let massLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let navigateBackButton: UIButton = {
        let navigateBackButton = UIButton(type: .system)
        navigateBackButton.setImage(UIImage(named: "backButton"), for: .normal)
        navigateBackButton.tintColor = .backButton
        navigateBackButton.translatesAutoresizingMaskIntoConstraints = false
        return navigateBackButton
    }()
    
    private let DetailsStarButton: UIButton = {
        let DetailsStarButton = UIButton(type: .system)
        DetailsStarButton.translatesAutoresizingMaskIntoConstraints = false
        DetailsStarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        DetailsStarButton.tintColor = .name
        return DetailsStarButton
    }()
    
    private let detailsView: UIView = {
        let detailsView = UIView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.backgroundColor = .clear
        detailsView.layer.borderWidth = 1.5
        detailsView.layer.borderColor = UIColor.white.cgColor
        detailsView.layer.cornerRadius = 10
        return detailsView
    }()
    
    private let detailsView1: UIView = {
        let detailsView1 = UIView()
        detailsView1.translatesAutoresizingMaskIntoConstraints = false
        detailsView1.backgroundColor = .clear
        detailsView1.layer.borderWidth = 1.5
        detailsView1.layer.borderColor = UIColor.white.cgColor
        detailsView1.layer.cornerRadius = 10
        return detailsView1
    }()
    
    private let detailsView2: UIView = {
        let detailsView2 = UIView()
        detailsView2.translatesAutoresizingMaskIntoConstraints = false
        detailsView2.backgroundColor = .clear
        detailsView2.layer.borderWidth = 1.5
        detailsView2.layer.borderColor = UIColor.white.cgColor
        detailsView2.layer.cornerRadius = 10
        return detailsView2
    }()
    
    private let area: UILabel = {
        let area = UILabel()
        area.translatesAutoresizingMaskIntoConstraints = false
        area.font = UIFont.systemFont(ofSize: 18)
        area.text = "Area:"
        area.textColor = .white
        return area
    }()
    
    private let temperature: UILabel = {
        let temperature = UILabel()
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.font = UIFont.systemFont(ofSize: 18)
        temperature.text = "Temperature:"
        temperature.textColor = .white
        return temperature
    }()
    
    private let mass: UILabel = {
        let mass = UILabel()
        mass.translatesAutoresizingMaskIntoConstraints = false
        mass.font = UIFont.systemFont(ofSize: 18)
        mass.text = "Mass:"
        mass.textColor = .white
        return mass
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1)
        
        setupViews()
        configureViews()
        setupDetailsView()
        setupNavigationBar()
        setupBackButton()
        setupNameLabel()
        configureStarButton()
        //configureStarButton()
        setupStarButton()
        configureBackBtn()
    }
    
    private func setupViews() {
        view.addSubview(planetDetailImage)
        view.addSubview(nameLabel)
        view.addSubview(areaLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(massLabel)
        view.addSubview(navigateBackButton)
        view.addSubview(DetailsStarButton)
        
        NSLayoutConstraint.activate([
            planetDetailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            planetDetailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetDetailImage.widthAnchor.constraint(equalToConstant: 280),
            planetDetailImage.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func setupStarButton() {
        NSLayoutConstraint.activate([
            DetailsStarButton.centerYAnchor.constraint(equalTo: navigateBackButton.centerYAnchor),
            DetailsStarButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            DetailsStarButton.widthAnchor.constraint(equalToConstant: 20),
            DetailsStarButton.widthAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    private func configureStarButton() {
        DetailsStarButton.addAction(UIAction(handler: { [weak self] _ in
            self?.starButtonTapped()
        }), for: .touchUpInside)
    }
    
    //gsdgnsjngsjngjnsdgnjsd
    func starButtonTapped() {
        guard let planet = planet else { return }
        planet.isFavorite.toggle()
        if DetailsStarButton.tintColor == UIColor.name {
                DetailsStarButton.tintColor = .yellow
            } else {
                DetailsStarButton.tintColor = .white
            }
        delegate?.didUpdateFavoriteStatus(planet: planet)
    }
    
    private func setupBackButton() {
        view.addSubview(navigateBackButton)
        
        NSLayoutConstraint.activate([
            navigateBackButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            navigateBackButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        ])
    }
    
    func configureBackBtn() {
        navigateBackButton.addAction(UIAction(handler: { [weak self] action in
            self?.backbuttonPressed()
        }), for: .touchUpInside)
    }
    
    func backbuttonPressed() {
        configureViews()
        navigationController?.popViewController(animated: true)
        //planet?.isFavorite.toggle()
        
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupDetailsView() {
        view.addSubview(detailsView)
        view.addSubview(detailsView1)
        view.addSubview(detailsView2)
        detailsView.addSubview(areaLabel)
        detailsView1.addSubview(temperatureLabel)
        detailsView2.addSubview(massLabel)
        detailsView.addSubview(area)
        detailsView1.addSubview(temperature)
        detailsView2.addSubview(mass)
        
        NSLayoutConstraint.activate([
            detailsView.heightAnchor.constraint(equalToConstant: 50),
            detailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            detailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185),
            
            detailsView1.heightAnchor.constraint(equalToConstant: 50),
            detailsView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            detailsView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            detailsView1.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 10),
            
            detailsView2.heightAnchor.constraint(equalToConstant: 50),
            detailsView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            detailsView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            detailsView2.topAnchor.constraint(equalTo: detailsView1.bottomAnchor, constant: 10),
            
            areaLabel.rightAnchor.constraint(equalTo: detailsView.rightAnchor, constant: -20),
            areaLabel.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            area.leftAnchor.constraint(equalTo: detailsView.leftAnchor, constant: 20),
            area.centerXAnchor.constraint(equalTo: detailsView.centerXAnchor),
            area.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            
            temperatureLabel.rightAnchor.constraint(equalTo: detailsView1.rightAnchor, constant: -20),
            temperatureLabel.centerYAnchor.constraint(equalTo: detailsView1.centerYAnchor),
            temperature.leftAnchor.constraint(equalTo: detailsView1.leftAnchor, constant: 20),
            temperature.centerXAnchor.constraint(equalTo: detailsView1.centerXAnchor),
            temperature.centerYAnchor.constraint(equalTo: detailsView1.centerYAnchor),
            
            massLabel.rightAnchor.constraint(equalTo: detailsView2.rightAnchor, constant: -20),
            massLabel.centerYAnchor.constraint(equalTo: detailsView2.centerYAnchor),
            mass.leftAnchor.constraint(equalTo: detailsView2.leftAnchor, constant: 20),
            mass.centerXAnchor.constraint(equalTo: detailsView2.centerXAnchor),
            mass.centerYAnchor.constraint(equalTo: detailsView2.centerYAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func configureViews() {
        guard let planet = planet else { return }
        planetDetailImage.image = UIImage(named: planet.image)
        nameLabel.text = planet.name
        areaLabel.text = "\(planet.area)"
        temperatureLabel.text = "\(planet.temperature)"
        massLabel.text = "\(planet.mass)"
        
        
        DetailsStarButton.tintColor = planet.isFavorite ? .yellow : .name
    }
}




