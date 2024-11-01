//
//  ViewController.swift
//  Assignment11
//
//  Created by Gio Kakaladze on 07.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNumTextField: UITextField?
    @IBOutlet weak var secondNumTextField: UITextField?
    @IBOutlet weak var divisionChangeSwitch: UISwitch?
    @IBOutlet weak var divisionLabel: UILabel?
    @IBOutlet weak var resultLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisionChangePressed()
    }
    
    @IBAction func divisionSwitchChanged(_ sender: UISwitch) {
        divisionChangePressed()
    }
    
    func divisionChangePressed() {
        if divisionChangeSwitch?.isOn == true {
            divisionLabel?.text = "ნაშთიანი გაყოფა"
        } else {
            divisionLabel?.text = "უნაშთო გაყოფა"
        }
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let firstTextField = firstNumTextField?.text ?? ""
        let secondTextField = secondNumTextField?.text ?? ""
        
        if let firtNum = Int(firstTextField), let secondNum = Int(secondTextField) {
            if secondNum == 0 {
                resultLabel?.text = "ნულზე გაყოფა არ შეიძლება"
            } else if divisionChangeSwitch?.isOn == true {
                if firtNum % secondNum == 0 {
                    resultLabel?.text = "პასუხი: 0"
                } else {
                    let remainderResult = firtNum % secondNum
                    resultLabel?.text = "პასუხი: \(remainderResult)"
                }
            } else {
                // Handle integer division
                if divisionChangeSwitch?.isOn == false && firtNum % secondNum == 0 {
                    let result = firtNum / secondNum
                    resultLabel?.text = "პასუხი: \(result)"
                } else if divisionChangeSwitch?.isOn == false && firtNum % secondNum != 0{
                    resultLabel?.text = "პასუხი: 0"
                }
            }
        } else {
            resultLabel?.text = "გთხოვთ შეიყვანოთ რიცხვები"
        }
    }
}





