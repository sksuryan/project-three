//
//  NewEventVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/19/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class NewEventVC: UIViewController {

    let nameTextField = TAITextField(text: "Enter Event Name")
    let dateField = TAITextField(text: "Eneter a Date")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureFields()
        addSaveButton()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "New Event"
    }

    private func addSaveButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonPressed))
    }
    
    
    @objc func saveButtonPressed(){
        let newEvent = Event(name: nameTextField.text!, date: dateField.text!)
        let homeVC = HomeVC()
        homeVC.eventList.append(newEvent)
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    private func configureFields(){
        view.addSubview(nameTextField)
        view.addSubview(dateField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        dateField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            dateField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateField.heightAnchor.constraint(equalToConstant: 50)
            
            
        
        
        ])
    }
}
