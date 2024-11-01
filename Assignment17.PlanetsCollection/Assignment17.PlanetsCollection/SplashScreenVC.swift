//
//  SplashScreenVC.swift
//  Assignment17.PlanetsCollection
//
//  Created by Gio Kakaladze on 21.10.24.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    private let appNameLabel: UILabel = {
        let appNameLabel = UILabel()
        appNameLabel.text = "Solar System"
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return appNameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1) 
        setupLabel()
        navigateToMainApp()
    }
    
    private func setupLabel() {
        view.addSubview(appNameLabel)
        appNameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        appNameLabel.textColor = .name
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appNameLabel.widthAnchor.constraint(equalToConstant: 200),
            appNameLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func navigateToMainApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            
            let mainVC = PlanetsCollectionVC()
            let navigationController = UINavigationController(rootViewController: mainVC)
            navigationController.isNavigationBarHidden = true
            
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}




