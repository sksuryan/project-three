//
//  RegistrationVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    let userToggle = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureToggle()
    }
    
    private func configureToggle(){
        view.addSubview(userToggle)
        userToggle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            userToggle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            userToggle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userToggle.heightAnchor.constraint(equalToConstant: 50)
        
        
        
        ])
    }



}
