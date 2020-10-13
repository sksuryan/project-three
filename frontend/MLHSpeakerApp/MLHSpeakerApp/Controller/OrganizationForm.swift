//
//  OrganizationForm.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/13/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class OrganizationForm: UIViewController {

    let nameTextField = TAITextField(text: "Enter Name")
    let websiteTextField = TAITextField(text: "Enter Website")
    let descriptionTextField = TAITextField(text: "Tell us about your organization")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Organization"
        configureTextFields()
    }
    
    
    private func configureTextFields(){
        view.addSubview(nameTextField)
        view.addSubview(websiteTextField)
        view.addSubview(descriptionTextField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        websiteTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            websiteTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            websiteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            websiteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            websiteTextField.heightAnchor.constraint(equalToConstant: 45),
            
            descriptionTextField.topAnchor.constraint(equalTo: websiteTextField.bottomAnchor, constant: 20),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    
}
