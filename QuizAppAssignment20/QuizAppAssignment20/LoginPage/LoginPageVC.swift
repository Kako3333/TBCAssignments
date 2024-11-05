//
//  ViewController.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 02.11.24.
//

import UIKit
import Security

class LoginPageVC: UIViewController, UITextFieldDelegate {
    
    private let viewModel = LoginPageViewModel()
    
    private let loginImage: UIImageView = {
        var loginImage = UIImageView()
        loginImage = UIImageView(image: UIImage(named: "addUserIcon"))
        loginImage.translatesAutoresizingMaskIntoConstraints = false
        return loginImage
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    private let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.layer.cornerRadius = 12
        usernameTextField.text = "Enter username"
        usernameTextField.textColor = UIColor(red: 144/255.0, green: 144/255.0, blue: 144/255.0, alpha: 1.0)
        usernameTextField.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        usernameTextField.backgroundColor = .white
        usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: usernameTextField.frame.height))
        usernameTextField.leftViewMode = .always
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        return usernameTextField
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.text = "Enter password"
        passwordTextField.textColor = UIColor(red: 144/255.0, green: 144/255.0, blue: 144/255.0, alpha: 1.0)
        passwordTextField.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        passwordTextField.backgroundColor = .white
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private let ConfirmPasswordLabel: UILabel = {
        let ConfirmPasswordLabel = UILabel()
        ConfirmPasswordLabel.text = "Confirm Password"
        ConfirmPasswordLabel.textColor = .white
        ConfirmPasswordLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        ConfirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        return ConfirmPasswordLabel
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let ConfirmPasswordTextField = UITextField()
        ConfirmPasswordTextField.layer.cornerRadius = 12
        ConfirmPasswordTextField.text = "Confirm password"
        ConfirmPasswordTextField.textColor = UIColor(red: 144/255.0, green: 144/255.0, blue: 144/255.0, alpha: 1.0)
        ConfirmPasswordTextField.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        ConfirmPasswordTextField.backgroundColor = .white
        ConfirmPasswordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: ConfirmPasswordTextField.frame.height))
        ConfirmPasswordTextField.leftViewMode = .always
        ConfirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        return ConfirmPasswordTextField
    }()
    
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(loginImage)
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(ConfirmPasswordLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(loginButton)
        view.backgroundColor = UIColor(red: 12/255.0, green: 16/255.0, blue: 38/255.0, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            loginImage.widthAnchor.constraint(equalToConstant: 104),
            loginImage.heightAnchor.constraint(equalToConstant: 98),
            loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 50),
            usernameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 26),
            
            usernameTextField.heightAnchor.constraint(equalToConstant: 41),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18),
            usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 26),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 41),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18),
            
            ConfirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            ConfirmPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 26),
            
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 41),
            confirmPasswordTextField.topAnchor.constraint(equalTo: ConfirmPasswordLabel.bottomAnchor, constant: 10),
            confirmPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18),
            confirmPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18),
            
            loginButton.heightAnchor.constraint(equalToConstant: 42),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
        ])
        
        loginButton.addAction(UIAction(handler: { [weak self] action in
            self?.loginButtonPressed()
        }), for: .touchUpInside)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func loginButtonPressed() {
        let mainPageVC = MainPageVC()
        
        viewModel.username = usernameTextField.text
        viewModel.password = passwordTextField.text
        viewModel.confirmPassword = confirmPasswordTextField.text
        
        if !viewModel.isInputValid {
            print("Please fill in all fields.")
            return
        }
        
        if !viewModel.doPasswordsMatch {
            print("Passwords do not match.")
            return
        }
        
        do {
            try viewModel.saveCredentials()
            navigationController?.pushViewController(mainPageVC, animated: true)
            print("Username and password saved")
        }
        catch {
            print("Can't save data: \(error.localizedDescription)")
        }
    }
}

