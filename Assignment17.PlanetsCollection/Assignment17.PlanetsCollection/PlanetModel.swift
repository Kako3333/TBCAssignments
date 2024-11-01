//
//  PlanetModel.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 21.10.24.
//

class Planet {
    var name: String
    var image: String
    var area: String
    var mass: String
    var temperature: String
    var isFavorite: Bool = false
    
    init(name: String, image: String, area: String, mass: String, temperature: String) {
        self.name = name
        self.image = image
        self.area = area
        self.mass = mass
        self.temperature = temperature
    }
}
