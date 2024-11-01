//
//  PlanetListVC.swift
//  Assignment16.Planets
//
//  Created by Gio Kakaladze on 18.10.24.
//

import UIKit

class PlanetsListVC: UIViewController {
    // გთხოვთ ამაში არ დამაკლოთ ქულა უბრალოდ ფოტოები ვერვნახე რომელსაც ასეტები მიიღებდა 🙏
    // ასევე ჰედერი იგივე კოდით უფრო მაღლა იყო როგორც ფიგმაში მაგრამ სცენებში კოდი როცა შევცვალე ეგეც შეიცვალა და არც ვიცი რატო
    //უკან დაბრუნების ღილაკიც არ მუშაობს ტოპ36, ლეფტ36-ს როცა ვუწერ რადგან რაღაც ეფარება და ვერ ვაკლიკავ. ვერ გავასწორე ამიტომ ჩამოვწიე დაბლა
    let planets = [
        (name: "Mars", imageName: "mars1", area: "1,258,250 km2", temperature: "−63 °C", mass: "6.42×10 23kg"),
        (name: "Jupiter", imageName: "jupiter", area: "6,142,310 km²", temperature: "-108 °C", mass: "1.90 × 10²⁷ kg"),
        (name: "Earth", imageName: "earth", area: "510,100,100 km2", temperature: "15 °C", mass: "5.97×10 24kg"),
        (name: "Jupiter", imageName: "jupiter", area: "6,142,310 km²", temperature: "-108 °C", mass: "1.90 × 10²⁷ kg"),
        (name: "Mars", imageName: "mars1", area: "1,258,250 km2", temperature: "−63 °C", mass: "6.42×10 23kg"),
        (name: "Earth", imageName: "earth", area: "510,100,100 km2", temperature: "15 °C", mass: "5.97×10 24kg"),
        (name: "Jupiter", imageName: "jupiter", area: "6,142,310 km²", temperature: "-108 °C", mass: "1.90 × 10²⁷ kg"),
        (name: "Earth", imageName: "earth", area: "510,100,100 km2", temperature: "15 °C", mass: "5.97×10 24kg")
    ]
    
    private let planetsTableView: UITableView = {
        let planetsTableView = UITableView()
        planetsTableView.translatesAutoresizingMaskIntoConstraints = false
        planetsTableView.register(PlanetCell.self, forCellReuseIdentifier: PlanetCell.identifier)
        return planetsTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(planetsTableView)
        planetsTableView.backgroundColor = UIColor (red: 33/255, green: 13/255, blue: 4/255, alpha: 1)
        self.planetsTableView.dataSource = self
        self.planetsTableView.delegate = self
        
        NSLayoutConstraint.activate([
            planetsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            planetsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            planetsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            planetsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
    }
}

#Preview {
    PlanetsListVC()
}
