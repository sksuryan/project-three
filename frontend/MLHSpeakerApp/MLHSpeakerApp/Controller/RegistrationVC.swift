//
//  RegistrationVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    let nameTextField = TAITextField(text: "Enter Name")
    let emailTextField = TAITextField(text: "Email")
    let passwordTextField = TAITextField(text: "Password")
    let speakerLabel = UILabel()
    let speakerToggle = UISwitch()
    let signupButton = TAIButton(text: "Sign Up")
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTextFields()
        configureToggle()
        configureSignupButton()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false,animated: true)
    }
    
    
    @objc func signUpButtonPressed(){

        let user = UserSignUp(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, isSpeaker: speakerToggle.isOn)
        let jsonData = try! JSONEncoder().encode(user)
        
        NetworkManager.shared.registerUser(userData: jsonData) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let token):
                print(token)
                
            case .failure(let error):
                print(error.rawValue)
                let alert = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                DispatchQueue.main.sync {
                    self.present(alert,animated: true)
                }
            }
        }





    }



    
    private func configureViewController(){
        view.backgroundColor = .systemGray3
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Register"
    }
    
    
    private func configureTextFields(){
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        
        ])

    }
    
    
    private func configureToggle(){
        view.addSubview(speakerLabel)
        view.addSubview(speakerToggle)
        
        speakerLabel.translatesAutoresizingMaskIntoConstraints = false
        speakerLabel.text = "Are you a speaker?"
        speakerLabel.font = speakerLabel.font.withSize(20)
        speakerToggle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            speakerLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            speakerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            speakerLabel.widthAnchor.constraint(equalToConstant: 200),
            speakerLabel.heightAnchor.constraint(equalToConstant: 50),
        
            speakerToggle.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            speakerToggle.leadingAnchor.constraint(equalTo: speakerLabel.trailingAnchor, constant: 10),
            speakerToggle.widthAnchor.constraint(equalToConstant: 25),
            speakerToggle.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    

    
    private func configureSignupButton(){
        view.addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.backgroundColor = .systemBlue
        signupButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            signupButton.topAnchor.constraint(equalTo: speakerToggle.bottomAnchor, constant: 40),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
}
