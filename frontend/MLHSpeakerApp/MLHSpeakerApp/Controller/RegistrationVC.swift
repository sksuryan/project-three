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
    let userSignUpButton = UIButton()
    let organizationSignUpButton = UIButton()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureToggle()
        configureViewController()
        configureUserSignupButton()
        configureOrgSignupButton()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false,animated: true)
    }
    
    
    private func configureViewController(){
        view.backgroundColor = .white
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


    private func configureUserSignupButton(){
        view.addSubview(userSignUpButton)
        userSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        userSignUpButton.backgroundColor = .red
        userSignUpButton.addTarget(self, action: #selector(userSignupButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            userSignUpButton.topAnchor.constraint(equalTo: speakerToggle.bottomAnchor, constant: 20),
            userSignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userSignUpButton.widthAnchor.constraint(equalToConstant: 50),
            userSignUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureOrgSignupButton(){
        view.addSubview(organizationSignUpButton)
        organizationSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        organizationSignUpButton.backgroundColor = .blue
        organizationSignUpButton.addTarget(self, action: #selector(orgSignupButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            organizationSignUpButton.topAnchor.constraint(equalTo: speakerToggle.bottomAnchor, constant: 20),
            organizationSignUpButton.leadingAnchor.constraint(equalTo: userSignUpButton.trailingAnchor, constant: 20),
            organizationSignUpButton.widthAnchor.constraint(equalToConstant: 50),
            organizationSignUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func userSignupButtonPressed(){
        self.navigationController?.pushViewController(UserFormVC(), animated: true)
    }

    
    @objc func orgSignupButtonPressed(){
        self.navigationController?.pushViewController(OrganizationForm(), animated: true)
    }

}
