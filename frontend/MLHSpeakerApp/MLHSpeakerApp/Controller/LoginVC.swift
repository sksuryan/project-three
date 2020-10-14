//
//  LoginVC.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    var imageConstraintStart: NSLayoutConstraint!
    var imageConstraintEnd: NSLayoutConstraint!
    let imageView = UIImageView()
    let usernameTextField = TAITextField(text: "username")
    let passwordTextField = TAITextField(text: "password")
    let loginButton = TAIButton(text: "Log in")
    let registrationButton = TAIButton(text: "Register")
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        navigationController?.isNavigationBarHidden = true
        configureImageView()
        configureUsernameTF()
        configurePasswordTF()
        configureLoginButton()
        configureRegisterButton()
        createDismissKeyboardTapGesture()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        imageConstraintStart.isActive = false
        imageConstraintEnd.isActive = true
        
        UIView.animate(withDuration: 1.59, delay: 0.2,
                       usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
                        self.view.layoutIfNeeded()
                        self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    func configureImageView(){
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")!
        
        imageConstraintStart = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        imageConstraintStart.isActive = true
        
        //Right now it's off
        imageConstraintEnd = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        imageView.transform = CGAffineTransform(scaleX: 0, y: 0)

        
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
           
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configureUsernameTF(){
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configurePasswordTF(){
        view.addSubview(passwordTextField)
        passwordTextField.isSecureTextEntry = true

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    
    func configureLoginButton(){
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(testLogin), for: .touchUpInside)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureRegisterButton(){
        view.addSubview(registrationButton)
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.backgroundColor = .systemGray2
        registrationButton.addTarget(self, action: #selector(pushRegistrationVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            registrationButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    @objc func testLogin(){
        if usernameTextField.text == nil && passwordTextField.text == nil{
            return
        }

        let user = User(email: usernameTextField.text!, password: passwordTextField.text!)
        let jsonData = try! JSONEncoder().encode(user)

        NetworkManager.shared.getToken(userData: jsonData) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let token):
                print(token)
                
            case .failure(let error):
                print(error.rawValue)
                let alert = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true)
            }
        }

    }


    
    @objc func pushRegistrationVC(){
        self.navigationController?.pushViewController(RegistrationVC(), animated: true)
    }
    
    
}
