//
//  TrashViewModel.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
import SwiftUI

class TrashViewModel: ObservableObject {
    @Published var xPos1: CGFloat = 200
    @Published var yPos1: CGFloat = 300
    
    @Published var xPos2: CGFloat = 300
    @Published var yPos2: CGFloat = 650
    
    @Published var isCollided = false
    
    func checkForCollision() {
        if abs(xPos1 - xPos2) < 100 && abs(yPos1 - yPos2) < 100 {
            isCollided = true
        }
    }
    
    func updatePosition(fileX: CGFloat, fileY: CGFloat) {
        xPos1 = fileX
        yPos1 = fileY
        checkForCollision()
    }
    
    func onAppear(geometry: GeometryProxy) {
        xPos2 = geometry.size.width * 0.75
        yPos2 = geometry.size.height * 0.75
    }
}
