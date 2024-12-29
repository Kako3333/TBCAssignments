//
//  SceneDelegate.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let vc = MainPageViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = true
        navigationController.isNavigationBarHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
}

