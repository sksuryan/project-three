//
//  UserFormVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/12/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class UserFormVC: UIViewController {

    let nameTextField = TAITextField(text: "Enter Name")
    let topicsTextField = TAITextField(text: "Enter Topics")
    let onLocationLabel = UILabel()
    let onLocationToggle = UISwitch()
    let qualifTextField = TAITextField(text: "Enter Qualifications")
    let streamTextField = TAITextField(text: "Enter Stream")
    let expTextField = TAITextField(text: "Enter Years of Experience")
    let linkedinTextField = TAITextField(text: "Linkedin URL")
    let portfolioTextField = TAITextField(text: "Portfolio URL")
    let videoTextField = TAITextField(text: "Enter Videos")
    let datesInput = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTextFields()
        addCreateButton()
        title = "New User"
        

    }
    
    
    private func addCreateButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(createButtonPresed))
    }
    
    
    private func configureTextFields(){
        view.addSubview(nameTextField)
        view.addSubview(topicsTextField)
        view.addSubview(onLocationLabel)
        view.addSubview(onLocationToggle)
        view.addSubview(qualifTextField)
        view.addSubview(streamTextField)
        view.addSubview(expTextField)
        view.addSubview(linkedinTextField)
        view.addSubview(portfolioTextField)
        view.addSubview(videoTextField)
        view.addSubview(datesInput)

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        topicsTextField.translatesAutoresizingMaskIntoConstraints = false
        onLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        onLocationToggle.translatesAutoresizingMaskIntoConstraints = false
        qualifTextField.translatesAutoresizingMaskIntoConstraints = false
        streamTextField.translatesAutoresizingMaskIntoConstraints = false
        expTextField.translatesAutoresizingMaskIntoConstraints = false
        linkedinTextField.translatesAutoresizingMaskIntoConstraints = false
        portfolioTextField.translatesAutoresizingMaskIntoConstraints = false
        videoTextField.translatesAutoresizingMaskIntoConstraints = false
        datesInput.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            topicsTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            topicsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topicsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topicsTextField.heightAnchor.constraint(equalToConstant: 45),
            
            onLocationLabel.topAnchor.constraint(equalTo: topicsTextField.bottomAnchor, constant: 5),
            onLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onLocationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            onLocationLabel.heightAnchor.constraint(equalToConstant: 10),
            
            onLocationToggle.topAnchor.constraint(equalTo: onLocationLabel.bottomAnchor, constant: 5),
            onLocationToggle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onLocationToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            onLocationToggle.heightAnchor.constraint(equalToConstant: 25),
            
            qualifTextField.topAnchor.constraint(equalTo: onLocationToggle.bottomAnchor, constant: 5),
            qualifTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            qualifTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            qualifTextField.heightAnchor.constraint(equalToConstant: 45),
            
            streamTextField.topAnchor.constraint(equalTo: qualifTextField.bottomAnchor, constant: 5),
            streamTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            streamTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            streamTextField.heightAnchor.constraint(equalToConstant: 45),
            
            expTextField.topAnchor.constraint(equalTo: streamTextField.bottomAnchor, constant: 5),
            expTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            expTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            expTextField.heightAnchor.constraint(equalToConstant: 45),
            
            linkedinTextField.topAnchor.constraint(equalTo: expTextField.bottomAnchor, constant: 5),
            linkedinTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            linkedinTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            linkedinTextField.heightAnchor.constraint(equalToConstant: 45),
            
            portfolioTextField.topAnchor.constraint(equalTo: linkedinTextField.bottomAnchor, constant: 5),
            portfolioTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            portfolioTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            portfolioTextField.heightAnchor.constraint(equalToConstant: 45),
            
            videoTextField.topAnchor.constraint(equalTo: portfolioTextField.bottomAnchor, constant: 5),
            videoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            videoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            videoTextField.heightAnchor.constraint(equalToConstant: 45),
            
            datesInput.topAnchor.constraint(equalTo: videoTextField.bottomAnchor, constant: 5),
            datesInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            datesInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            datesInput.heightAnchor.constraint(equalToConstant: 45),
            
        
        ])
        
    }
    
    @objc func createButtonPresed(){
        self.view.window?.rootViewController = MainTabBar().createTabBar()
    }

    
}
