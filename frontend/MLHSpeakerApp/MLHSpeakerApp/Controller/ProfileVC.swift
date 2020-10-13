//
//  ProfileVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    let profileImage = UIImage()
    let nameLabel = UILabel()
    let locationLabel = UILabel()
    let professionLabel = UILabel()
    let workExperienceLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        addEditButton()
    }
    
    
    private func configureVC(){
        view.backgroundColor = .white

    }
    
    
    private func addEditButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editButtonPresed))
    }
    
    
    @objc func editButtonPresed(){
        navigationController?.pushViewController(UserFormVC(), animated: true)
    }


    

}
