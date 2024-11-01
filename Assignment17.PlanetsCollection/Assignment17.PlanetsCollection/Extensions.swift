//
//  Extensions.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 21.10.24.
//

import UIKit

extension PlanetsCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate, PlanetCellDelegate, funcFromDetail {
    
    func didUpdateFavoriteStatus(planet: Planet) {
        if let index = planets.firstIndex(where: { $0.name == planet.name }) {
                    planets[index].isFavorite = planet.isFavorite
                    planets.sort { $0.isFavorite && !$1.isFavorite }
                    planetsCollectioView.reloadData()
                }
    }


    func starButtonTapped(cell: PlanetCell) {
        if let indexPath = planetsCollectioView.indexPath(for: cell) {
            let planet = planets[indexPath.row]
            planet.isFavorite.toggle()
            planets.sort { $0.isFavorite && !$1.isFavorite }
            planetsCollectioView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = planetsCollectioView.dequeueReusableCell(withReuseIdentifier: PlanetCell.identifier, for: indexPath) as? PlanetCell else {
            return UICollectionViewCell()
        }
        
        let planet = planets[indexPath.row]
        cell.configure(with: planet)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedPlanet = planets[indexPath.row]
        let planetDetailsVC = PlanetDetailsVC()
        planetDetailsVC.delegate = self
        planetDetailsVC.planet = selectedPlanet
        navigationController?.pushViewController(planetDetailsVC, animated: true)
    }
}


//UUUIIIIII
extension PlanetsCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let spacing: CGFloat = 2
        let totalSpacing = (itemsPerRow - 1) * spacing
        
        let leftInset: CGFloat = 2
        let rightInset: CGFloat = 2
        let totalWidth = collectionView.frame.width - leftInset - rightInset - totalSpacing
        
        let itemWidth = totalWidth / itemsPerRow
        
        return CGSize(width: itemWidth, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PlanetsHeader.identifier, for: indexPath) as! PlanetsHeader
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        50
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}

