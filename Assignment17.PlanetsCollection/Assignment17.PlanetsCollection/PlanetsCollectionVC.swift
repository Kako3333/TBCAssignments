//
//  PlanetsCollectionVC.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 20.10.24.
//

import UIKit

class PlanetsCollectionVC: UIViewController {
    
    let planetsCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let planetsCollectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        planetsCollectioView.backgroundColor = .systemBackground
        planetsCollectioView.register(PlanetCell.self, forCellWithReuseIdentifier: PlanetCell.identifier)
        planetsCollectioView.register(PlanetsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlanetsHeader.identifier)
        layout.scrollDirection = .vertical
        return planetsCollectioView
    }()
    
    var planets = [
        Planet(name: "Mercury", image: "mercury", area: "74,800,000 km²", mass: "3.30 x 10^23 kg", temperature: "167°C"),
        Planet(name: "Venus", image: "venus", area: "460,234,000 km²", mass: "4.87 x 10^24 kg", temperature: "464°C"),
        Planet(name: "Earth", image: "earth", area: "510,100,000 km²", mass: "5.97 x 10^24 kg", temperature: "15°C"),
        Planet(name: "Mars", image: "mars", area: "144,371,000 km²", mass: "6.42 x 10^23 kg", temperature: "-63°C"),
        Planet(name: "Jupiter", image: "jupiter", area: "61,418,738,000 km²", mass: "1.90 x 10^27 kg", temperature: "-108°C"),
        Planet(name: "Saturn", image: "saturn", area: "42,700,000,000 km²", mass: "5.68 x 10^26 kg", temperature: "-139°C"),
        Planet(name: "Uranus", image: "uranus", area: "8,083,000,000 km²", mass: "8.68 x 10^25 kg", temperature: "-197°C"),
        Planet(name: "Neptune", image: "neptune", area: "7,618,000,000 km²", mass: "1.02 x 10^26 kg", temperature: "-201°C"),
        Planet(name: "Pluto", image: "pluto", area: "16,647,940 km²", mass: "1.31 x 10^22 kg", temperature: "-229°C"),
           Planet(name: "Eris", image: "eris", area: "2,326,000 km²", mass: "1.66 x 10^22 kg", temperature: "-243°C"),
           Planet(name: "Kepler-22b", image: "kepler", area: "149,000,000 km²", mass: "1.28 x 10^25 kg", temperature: "22°C"),
           Planet(name: "Tatooine", image: "tatooine", area: "104,654,000 km²", mass: "6.40 x 10^24 kg", temperature: "43°C"),
           Planet(name: "Coruscant", image: "coruscant", area: "510,000,000 km²", mass: "6.00 x 10^24 kg", temperature: "15°C")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.planetsCollectioView.delegate = self
        self.planetsCollectioView.dataSource = self
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        planetsCollectioView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(planetsCollectioView)
        planetsCollectioView.translatesAutoresizingMaskIntoConstraints = false
        planetsCollectioView.backgroundColor = UIColor (red: 33/255, green: 13/255, blue: 4/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            planetsCollectioView.topAnchor.constraint(equalTo: view.topAnchor),
            planetsCollectioView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            planetsCollectioView.leftAnchor.constraint(equalTo: view.leftAnchor),
            planetsCollectioView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
       
    }
}

#Preview {
    PlanetsCollectionVC()
}

