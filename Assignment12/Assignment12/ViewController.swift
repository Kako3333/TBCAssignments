//
//  ViewController.swift
//  Assignment12
//
//  Created by Gio Kakaladze on 09.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var lightDarkButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
    }
        
    private func addGradient() {
        // acButton
        let gradientTextColor = UIColor(red: 247/255, green: 60/255, blue: 87/255, alpha: 0.4)
        acButton.setTitle("AC", for: .normal)
        acButton.setAttributedTitle(NSAttributedString(string: acButton.title(for: .normal) ?? "", attributes: [NSAttributedString.Key.foregroundColor: gradientTextColor]), for: .normal)
        
        // lightDarkButton
        let gradientTintColor = UIColor(red: 247/255, green: 60/255, blue: 87/255, alpha: 0.4)
        lightDarkButton.tintColor = gradientTintColor
        
        // equalButton
        let gradient = CAGradientLayer()
        let colorOne = UIColor(red: 237/255, green: 14/255, blue: 152/255, alpha: 1.0)
        let colorTwo = UIColor(red: 254/255, green: 90/255, blue: 46/255, alpha: 1.0)

        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]

        gradient.locations = [0.0, 1.0]
        gradient.frame = equalButton.bounds
        equalButton.layer.insertSublayer(gradient, at: 0)
        equalButton.layer.cornerRadius = 30
        gradient.cornerRadius = 30
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        equalButton.layer.sublayers?.first?.frame = equalButton.bounds
    }
}

