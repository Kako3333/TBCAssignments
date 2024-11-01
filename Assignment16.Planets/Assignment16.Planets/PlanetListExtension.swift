//
//  PlanetListExtension.swift
//  Assignment16.Planets
//
//  Created by Gio Kakaladze on 18.10.24.
//

import UIKit

extension PlanetsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlanetCell.identifier, for: indexPath) as? PlanetCell else {
            fatalError("OARA")
        }
        
        let planet = planets[indexPath.row]
        cell.configure(with: planet)
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        
        cell.detailButtonPressed = { [weak self] in
            let detailsVC = PlanetDetailsVC()
            detailsVC.planet = (name: planet.name, imageName: planet.imageName, area: planet.area, temperature: planet.temperature, mass: planet.mass)
            self?.navigationController?.pushViewController(detailsVC, animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Planets"
        headerLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        headerLabel.textColor = .header
        headerLabel.textAlignment = .center
        headerView.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0)
        ])
        return headerView
    }
}

#Preview {
    PlanetsListVC()
}
    

    
    

