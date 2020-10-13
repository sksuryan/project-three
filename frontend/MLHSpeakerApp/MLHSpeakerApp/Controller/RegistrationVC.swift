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
    let speakerToggle = UISwitch()
    

    override func viewWillAppear(_ animated: Bool) {

        navigationController?.setNavigationBarHidden(false,animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureToggle()
        configureViewController()
    }
    
    private func configureViewController(){
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "New User"
    }
    
    private func configureTextFields(){
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            
        
        ])

    }
    
    
    
    private func configureToggle(){
        view.addSubview(speakerToggle)
        speakerToggle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            speakerToggle.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 50),
            speakerToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speakerToggle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            speakerToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            speakerToggle.heightAnchor.constraint(equalToConstant: 50),
            
        
        ])
    }



}
