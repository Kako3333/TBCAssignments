//
//  SceneDelegate.swift
//  newAssignment15
//
//  Created by Gio Kakaladze on 16.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let vc = CalculatorController()
        let navigationController = UINavigationController(rootViewController: vc)
        
        
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        
    }
}



